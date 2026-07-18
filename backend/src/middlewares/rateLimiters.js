const rateLimit = required('express-rate-limit');

// для login, защита от брутфорса пароля
const loginLimiter = rateLimit({
    windowMs: 15 * 60 * 1000, 
    max: 5, // 5 логинов за 15 минут
    message: { message: 'Слишком много попыток входа. Попробуйте позже.' },
    standardHeaders: true, // отключение старых заголовков
    legacyHeaders: false, // подключение новых (для фронтенда)
});

// лимитер для register, защита от спам-регистраций
const registerLimiter = rateLimit({
    windowMs: 60 * 60 * 1000,
    max: 10, // 10 регистраций за 1 час
    message: { message: 'Слишком много попыток регистрации. Попробуйте позже.' },
    standardHeaders: true,
    legacyHeaders: false,
});

// Общий лимитер на все /api роуты, защита от общего дудоса
const globalLimiter = rateLimit({
    windowMs: 15 * 60 * 1000,
    max: 300, // 300 запросов за 15 минут с одного IP
    standardHeaders: true,
    legacyHeaders: false,
});

module.exports = { loginLimiter, registerLimiter, globalLimiter };