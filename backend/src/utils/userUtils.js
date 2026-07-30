// единственное место, которое решает какие поля юзера видит клиент

// преобразует объект пользователя в формат, который можно безопасно отправлять клиенту
// (без пароля и других чувствительных данных)
function toPublicUser(user) {
    return {
        id: (user._id || user.id).toString(),
        email: user.email,
        username: user.username,
        avatarUrl: user.avatarUrl,
        status: user.status,
        lastSeen: user.lastSeen, // это тоже лучше отдавать для консистентности
    };
}

module.exports = { toPublicUser };