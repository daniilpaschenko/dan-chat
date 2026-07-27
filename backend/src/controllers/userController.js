const streamifier = require('streamifier');
const cloudinary = require('../config/cloudinary');
const User = require('../models/User');

const streamUpload = (buffer, publicId) => {
    return new Promise((resolve, reject) => {
        const stream = cloudinary.uploader.upload_stream(
            {
                folder: 'avatars',
                public_id: publicId,
                overwrite: true,
                resource_type: 'image',
                // обрезка на 400 x 400
                transformation: [{ width: 400, height: 400, crop: 'fill' }]
            },
            (error, result) => {
                if (result) resolve(result);
                else reject(error);
            }
        );
        // загрузка данных потоком из буффера
        streamifier.createReadStream(buffer).pipe(stream);
    });
};

// экранируем спецсимволы regex, чтобы юзер не мог сломать поиск
// или устроить ReDoS через специально подобранный паттерн
function escapeRegex(string) {
    return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

exports.getMe = async (req, res) => {
    res.json({ user: req.user });
};

exports.uploadAvatar = async (req, res) => {
    try {
        if (!req.file) {
            return res.status(400).json({ message: 'Файл не был загружен' });
        }

        // удаляем старый аватар в Cloudinary, если он там был
        if (req.user.avatarPublicId) {
            await cloudinary.uploader.destroy(req.user.avatarPublicId).catch((err) => {
                console.error('Ошибка удаления старого аватара:', err);
            });
        }

        const publicId = `${req.user.id}_${Date.now()}`;
        const result = await streamUpload(req.file.buffer, publicId);

        const updatedUser = await User.findByIdAndUpdate(
            req.user._id,
            {
                avatarUrl: result.secure_url,
                avatarPublicId: result.public_id,
            },
            { returnDocument: 'after' }
        );

        return res.status(200).json({ user: updatedUser });
    } catch (err) {
        console.error('uploadAvatar error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// GET /users/search?query=ali
// ищет пользователей по username/email (регистронезависимо), исключая себя
exports.searchUsers = async (req, res) => {
    try {
        const myId = req.user.id;
        const { query } = req.query;

        if (!query || query.trim().length < 3) {
            return res.status(400).json({ message: 'Минимум 3 символа для поиска' });
        }

        const safeQuery = escapeRegex(query.trim());
        const regex = new RegExp(safeQuery, 'i'); // 'i' — регистронезависимый поиск

        const users = await User.find({
            _id: { $ne: myId }, // исключаем себя из результатов
            $or: [{ username: regex }],
        })
            // совместим на фронтенде с PartialUser 
            .select('username avatarUrl status lastSeen') // не отдаём email/passwordHash всем подряд
            .limit(5); // защита от слишком тяжёлых запросов

        return res.json(users);
    } catch (err) {
        console.error('searchUsers error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};