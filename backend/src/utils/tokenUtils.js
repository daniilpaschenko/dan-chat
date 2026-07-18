const crypto = require('crypto');
const jwt = require('jsonwebtoken');

const JWT_SECRET = process.env.JWT_SECRET;
const ACCESS_EXPIRES_IN = '15m';
const REFRESH_EXPIRES_DAYS = 30;

// генерирует access token (короткоживущий JWT)
function signAccessToken(user) {
    return jwt.sign(
        { sub: user._id.toString(), username: user.username },
        JWT_SECRET,
        { expiresIn: ACCESS_EXPIRES_IN }
    );
}

// генерирует случайную строку для refresh token (криптографически случайную)
function generateRefreshToken() {
    return crypto.randomBytes(64).toString('hex');
}

// хэширует refresh token для хранения в БД (это не пароль, а случайная строка)
function hashToken(token) {
    return crypto.createHash('sha256').update(token).digest('hex');
}
// возвращает дату, когда для refresh token`а кончится действие
function getRefreshExpiryDate() {
    return new Date(Date.now() + REFRESH_EXPIRES_DAYS * 24 * 60 * 60 * 1000);
}

module.exports = {
    signAccessToken,
    generateRefreshToken,
    hashToken,
    getRefreshExpiryDate,
    REFRESH_EXPIRES_DAYS,
};