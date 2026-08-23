const cloudinary = require('../config/cloudinary');
const mongoose = require('mongoose');
const User = require('../models/User');
const { toPublicUser } = require('../utils/userUtils');
const { streamUpload } = require('../utils/cloudinaryUtils');
const { usernameSchema } = require('../validators/authValidator');

// экранируем спецсимволы regex, чтобы юзер не мог сломать поиск
// или устроить ReDoS через специально подобранный паттерн
function escapeRegex(string) {
    return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

exports.getMe = async (req, res) => {
    res.json({ user: toPublicUser(req.user) });
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
        const result = await streamUpload(req.file.buffer, {
            folder: 'avatars',
            publicId,
            transformation: [{ width: 1000, height: 1000, crop: 'fill', gravity: 'face' }],
        });

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
// ищет пользователей по username (регистронезависимо), исключая себя
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

// GET /users/:userId
// публичный профиль другого пользователя (только публичные поля)
exports.getUserById = async (req, res) => {
    try {
        const { userId } = req.params;

        if (!mongoose.Types.ObjectId.isValid(userId)) {
            return res.status(400).json({ message: 'Некорректный id пользователя' });
        }
        // только его username, аватарка статус и время последнего захода в сеть
        const user = await User.findById(userId).select('username avatarUrl status lastSeen');
        if (!user) return res.status(404).json({ message: 'Пользователь не найден' });

        return res.json(user);
    } catch (err) {
        console.error('getUserById error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// POST /users/device-token
// body: { token: string, platform: 'ios'|'android' }
exports.saveDeviceToken = async (req, res) => {
    try {
        const { token, platform } = req.body;

        if (!token || !['ios', 'android', 'web'].includes(platform)) {
            return res.status(400).json({ message: 'Некорректные данные токена' });
        }

        // сначала убираем этот токен у ВСЕХ юзеров — на случай если он был
        // выдан на этом устройстве другому аккаунту раньше (logout/login под другим юзером)
        await User.updateMany(
            { 'deviceTokens.token': token },
            { $pull: { deviceTokens: { token } } }
        );

        // затем добавляем текущему юзеру
        await User.findByIdAndUpdate(req.user.id, {
            $push: { deviceTokens: { token, platform, updatedAt: new Date() } },
        });

        return res.status(200).json({ message: 'Токен сохранён' });
    } catch (err) {
        console.error('saveDeviceToken error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// DELETE /users/device-token
// body: { token: string } — вызывать при logout
exports.removeDeviceToken = async (req, res) => {
    try {
        const { token } = req.body;
        if (!token) return res.status(400).json({ message: 'Токен обязателен' });

        await User.findByIdAndUpdate(req.user.id, {
            $pull: { deviceTokens: { token } },
        });

        return res.status(200).json({ message: 'Токен удалён' });
    } catch (err) {
        console.error('removeDeviceToken error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// POST /users/me/username
// body: { username: string }
exports.changeUsername = async (req, res) => {
    try {
        const { error, value } = usernameSchema.validate(req.body);
        if (error) {
            return res.status(400).json({ message: error.details[0].message });
        }

        const { username } = value;

        // если юзернейм не изменился — просто возвращаем текущего юзера
        if (username === req.user.username) {
            return res.status(200).json({ user: toPublicUser(req.user) });
        }

        // проверяем занятость (регистронезависимо)
        const existing = await User.findOne({
            _id: { $ne: req.user.id },
            username: new RegExp(`^${username}$`, 'i'),
        });

        if (existing) {
            return res.status(409).json({ message: 'Это имя пользователя уже занято' });
        }

        const updatedUser = await User.findByIdAndUpdate(
            req.user.id,
            { username },
            { returnDocument: 'after',
            runValidators: true } // проверка по валидаторам в схеме
        );

        return res.status(200).json({ user: toPublicUser(updatedUser) });
    } catch (err) {
        // на случай гонки — уникальный индекс в схеме подстрахует от дублей
        if (err.code === 11000) {
            return res.status(409).json({ message: 'Это имя пользователя уже занято' });
        }
        console.error('changeUsername error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};