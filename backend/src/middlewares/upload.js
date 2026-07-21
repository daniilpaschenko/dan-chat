const multer = require('multer');

const allowedMimeTypes = ['image/jpeg', 'image/png', 'image/webp'];

const fileFilter = (req, file, cb) => {
    // cb - это callback
    if (allowedMimeTypes.includes(file.mimetype)) {
        cb(null, true);
    } else {
        cb(new Error('Недопустимый формат файла. Разрешены: jpg, png, webp'));
    }
};

const upload = multer({
    storage: multer.memoryStorage(), // файл хранится в буфере
    fileFilter,
    limits: { fileSize: 5 * 1024 * 1024 }, // 5 МБ лимит пока что
});

module.exports = upload;