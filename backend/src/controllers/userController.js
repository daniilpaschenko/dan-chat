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