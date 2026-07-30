const Room = require('../models/Room');

// проверяет что юзер состоит в комнате, возвращает комнату или null
async function findRoomIfMember(roomId, userId) {
    const room = await Room.findById(roomId);
    if (!room) return null;

    const isMember = room.participants.some((p) => p.user.toString() === userId);
    if (!isMember) return null;

    return room;
}

module.exports = { findRoomIfMember };