const { initializeApp, cert } = require('firebase-admin/app');
const { getMessaging } = require('firebase-admin/messaging');
const User = require('../models/User');

const serviceAccount = require('../../serviceAccountKey.json');

// инициализация Firebase Admin SDK
initializeApp({
    credential: cert(serviceAccount),
});

const messaging = getMessaging();

// userIds: string[] — кому слать
// payload: { title, body, data? }
async function sendPushToUsers(userIds, { title, body, data = {} }) {
    // если некому слать
    if (userIds.length === 0) return;

    // находим юзеров по айди и вытаскиваем у них только девайс токены
    const users = await User.find({ _id: { $in: userIds } }).select('deviceTokens');
    // разворачиваем все токены в один плоский массив
    const tokens = users.flatMap((u) => u.deviceTokens.map((dt) => dt.token));

    // если ни у кого нет токенов
    if (tokens.length === 0) return;

    // FCM data payload — только строки допустимы в values
    // поэтому принудительно превращаем всё в строки
    const stringData = Object.fromEntries(
        Object.entries(data).map(([k, v]) => [k, String(v)])
    );

    const message = {
        notification: { title, body }, // что показывает система (заголовок + текст)
        data: stringData, // кастомные данные для приложения
        tokens, // массив FCM токенов
    };

    // возвращает результат по каждому токену отдельно (успех/ошибка)
    const response = await messaging.sendEachForMulticast(message);

    // чистим протухшие/невалидные токены
    const invalidTokens = [];
    response.responses.forEach((resp, idx) => {
        if (!resp.success) {
            const code = resp.error?.code;
            if (
                code === 'messaging/invalid-registration-token' ||
                code === 'messaging/registration-token-not-registered'
            ) {
                invalidTokens.push(tokens[idx]);
            }
        }
    });

    // удаляем эти токены у пользователей
    if (invalidTokens.length > 0) {
        await User.updateMany(
            {},
            { $pull: { deviceTokens: { token: { $in: invalidTokens } } } }
        );
    }

    return response;
}

module.exports = { sendPushToUsers };