const multer = require('multer');

const errorHandler = (err, req, res, next) => {
    // ошибки multer
    if (err instanceof multer.MulterError) {
        if (err.code === 'LIMIT_FILE_SIZE') {
            return res.status(400).json({
                message: 'Файл слишком большой. Максимальный размер: 5 МБ'
            });
        }
        return res.status(400).json({ message: err.message });
    }

    // другие ошибки (например, из fileFilter)
    if (err.message && err.message.includes('Недопустимый формат')) {
        return res.status(400).json({ message: err.message });
    }

    // Неизвестная ошибка
    console.error(err);
    return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
};

module.exports = errorHandler;