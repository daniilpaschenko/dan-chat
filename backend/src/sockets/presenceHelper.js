// проверяет, есть ли у юзера активные сокеты в его личной комнате user:${id}

function isUserOnline(io, userId) {
    const room = io.sockets.adapter.rooms.get(`user:${userId}`);
    return !!room && room.size > 0;
}

module.exports = { isUserOnline };