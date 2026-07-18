const bcrypt = require('bcryptjs');
const User = require('../models/User');
const RefreshToken = require('../models/RefreshToken');
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

// создаёт новую refresh-сессию в БД и возвращает сырой токен
async function issueRefreshToken(userId) {
    const rawToken = generateRefreshToken();
    await RefreshToken.create({
        tokenHash: hashToken(rawToken),
        userId,
        expiresAt: getRefreshExpiryDate(),
    });
    return rawToken;
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

exports.refresh = async (req, res) => {
    try {
        const { refreshToken: rawToken } = req.body;
        if (!rawToken) {
            return res.status(401).json({ message: 'Refresh token отсутствует' });
        }

        const tokenHash = hashToken(rawToken);
        const stored = await RefreshToken.findOne({ tokenHash });

        // токена нет в базе (никогда не выдавался или уже удалён)
        if (!stored) {
            return res.status(401).json({ message: 'Невалидный refresh token' });
        }

        // токен уже был отозван, но его пытаются использовать снова —
        // явный признак кражи (или бага с двойным запросом на клиенте)
        if (stored.revoked) {
            // защита: отзываем ВСЕ активные токены этого юзера, разлогиниваем везде
            await RefreshToken.updateMany( // "обнови все документы"
                { userId: stored.userId, revoked: false }, // у которых такой id и у который revoked: false
                { revoked: true } // поставь им revoked: true
            );
            return res.status(401).json({
                message: 'Обнаружено повторное использование токена. Все сессии отозваны, войдите заново',
            });
        }
        // подстраховка если по какой-то причине бд не удалил документ по истечении нужного срока
        if (stored.expiresAt < new Date()) { 
            return res.status(401).json({ message: 'Refresh token истёк' });
        }
        // загружаем юзера чтобы дать ему новые токены
        const user = await User.findById(stored.userId);
        if (!user) {
            return res.status(401).json({ message: 'Пользователь не найден' });
        }

        // РОТАЦИЯ: старый токен помечаем revoked, создаём новый
        const newRawToken = generateRefreshToken();
        const newTokenHash = hashToken(newRawToken);

        stored.revoked = true; // здесь помечаем (убираем старый токен)
        stored.replacedByHash = newTokenHash; // чем он был изменён
        await stored.save(); // сохранить изменения в бд

        await RefreshToken.create({
            tokenHash: newTokenHash,
            userId: user._id,
            expiresAt: getRefreshExpiryDate(), // генерация новой даты
        });

        const accessToken = signAccessToken(user);

        return res.status(200).json({
            accessToken,
            refreshToken: newRawToken, // обязательно сохранить его вместо старого
        });
    } catch (err) {
        console.error('refresh error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
}