const bcrypt = require('bcryptjs');
const User = require('../models/User');
const { registerSchema, loginSchema } = require('../validators/authValidator');
const {
    signAccessToken,
    generateRefreshToken,
    hashToken,
    getRefreshExpiryDate,
} = require('../utils/tokenUtils');


const SALT_ROUNDS = 12; // для bcrypt hashing

// преобразует объект пользователя в формат, который можно безопасно отправлять клиенту
// (без пароля и других чувствительных данных)
function toPublicUser(user) {
    return {
        id: user._id,
        email: user.email,
        username: user.username,
        avatarUrl: user.avatarUrl,
        status: user.status,
    };
}

exports.register = async (req, res) => {
    try {
        const { error, value } = registerSchema.validate(req.body);
        if (error) {
            // обязательно return чтобы код дальше не выполнился
            return res.status(400).json({ message: error.details[0].message });
        }

        const { email, password, username } = value;

        const existing = await User.findOne({ email });
        if (existing) {
            // обязательно return чтобы код дальше не выполнился
            return res.status(409).json({ message: 'Пользователь с таким email уже существует' });
        }

        const passwordHash = await bcrypt.hash(password, SALT_ROUNDS);

        const user = await User.create({
            email,
            passwordHash,
            username,
        });

        const accessToken = signAccessToken(user);
        const refreshToken = await issueRefreshToken(user._id);

        return res.status(201).json({
            accessToken,
            refreshToken,
            user: toPublicUser(user),
        });
    } catch (err) {
        console.error('register error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

exports.login = async (req, res) => {
    try {
        const { error, value } = loginSchema.validate(req.body);
        if (error) {
            // обязательно return чтобы код дальше не выполнился
            return res.status(400).json({ message: error.details[0].message });
        }

        const { email, password } = value;

        const user = await User.findOne({ email });
        if (!user) {
            // обязательно return чтобы код дальше не выполнился
            return res.status(401).json({ message: 'Неверный email или пароль' });
        }

        const isMatch = await bcrypt.compare(password, user.passwordHash);
        if (!isMatch) {
            // обязательно return чтобы код дальше не выполнился
            return res.status(401).json({ message: 'Неверный email или пароль' });
        }

        user.status = 'online';
        user.lastSeen = new Date();
        await user.save();

        const accessToken = signAccessToken(user);
        const refreshToken = await issueRefreshToken(user._id);

        return res.status(200).json({
            accessToken,
            refreshToken,
            user: toPublicUser(user),
        });
    } catch (err) {
        console.error('login error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};