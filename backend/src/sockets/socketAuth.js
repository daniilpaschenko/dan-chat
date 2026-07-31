const jwt = require('jsonwebtoken');
const User = require('../models/User');

const JWT_SECRET = process.env.JWT_SECRET;

// МИДДЛВАР ДЛЯ СОКЕТОВ
module.exports = async function socketAuth(socket, next) {
    try {
        /* когда клиент подключается, socket.io автоматически передаст:
        socket.handshake.auth = {
            token: "kjj384teug..."
        } */
        const token = socket.handshake.auth?.token;

        if (!token) {
            // next(new Error(...)) — запретить подключение
            return next(new Error('Токен не предоставлен'));
        }

        let payload;
        try {
            payload = jwt.verify(token, JWT_SECRET);
        } catch (err) {
            return next(new Error('Невалидный или истёкший токен'));
        }
        // payload.sub - id юзера
        // возвразаем юзера, но без поля passwordHash
        const user = await User.findById(payload.sub).select('-passwordHash');
        if (!user) {
            return next(new Error('Пользователь не найден'));
        }

        socket.user = user; // доступен дальше как socket.user
        next(); // разрешаем подключение
    } catch (err) {
        console.error('socketAuth error:', err);
        next(new Error('Внутренняя ошибка сервера'));
    }
};