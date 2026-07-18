const jwt = require('jsonwebtoken');
const User = require('../models/User');

const JWT_SECRET = process.env.JWT_SECRET;

module.exports = async function authMiddleware(req, res, next) {
    try {
        // получение заголовка Authorization из запроса
        const authHeader = req.headers.authorization;

        // если заголовка нет или он не начинается с Bearer
        if (!authHeader || !authHeader.startsWith('Bearer ')) {
            // обязательно return чтобы код дальше не выполнился
            return res.status(401).json({ message: 'Токен не предоставлен' }); 
        }

        // разбив на две строки "Bearer" и, например, "erheyrg" берём "erheyrg", т.е. токен без Bearer
        const token = authHeader.split(' ')[1];

        let payload;
        try {
            // проверка подписи токена
            payload = jwt.verify(token, JWT_SECRET);
        } catch (err) {
            if (err.name === 'TokenExpiredError') {
                // обязательно return чтобы код дальше не выполнился
                return res.status(401).json({ message: 'Токен истёк' });
            }
            // обязательно return чтобы код дальше не выполнился
            return res.status(401).json({ message: 'Невалидный токен' });
        }
        // payload.sub - это id юзера. находим юзера по id и исключаем его passwordHash чтобы его не засветить
        const user = await User.findById(payload.sub).select('-passwordHash');
        if (!user) {
            return res.status(401).json({ message: 'Пользователь не найден' });
        }
        // кладём найденного юзера прямо в объект req
        // Express передаёт один и тот же объект req через всю цепочку middleware → контроллер
        // поэтому всё, что мы туда запишем, будет доступно в следующем обработчике как req.user
        req.user = user; // доступен в дальнейших хендлерах

        //  "проверка пройдена, передай управление дальше" (другому middleware или уже к controller)
        next(); 
    } catch (err) {
        console.error('authMiddleware error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};