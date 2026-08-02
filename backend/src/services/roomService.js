const Room = require('../models/Room');
const User = require('../models/User');

// проверяет что юзер состоит в комнате, возвращает комнату или null
async function findRoomIfMember(roomId, userId) {
    const room = await Room.findById(roomId);
    if (!room) return null;

    const isMember = room.participants.some((p) => p.user.toString() === userId);
    if (!isMember) return null;

    return room;
}

// находит участника внутри уже загруженной комнаты
function getParticipant(room, userId) {
    return room.participants.find((p) => p.user.toString() === userId);
}

// актуальный статус всех участников комнаты (снэпшот на момент вызова)
// используется при room:join, чтобы клиент сразу знал статус, а не ждал presence:update
async function getParticipantsStatus(room) {
    const userIds = room.participants.map((p) => p.user);
    const users = await User.find({ _id: { $in: userIds } }).select('status lastSeen');

    return users.map((u) => ({
        userId: u._id.toString(),
        status: u.status,
        lastSeen: u.lastSeen,
    }));
}

module.exports = { findRoomIfMember, getParticipant, getParticipantsStatus };