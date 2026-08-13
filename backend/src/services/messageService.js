const Message = require('../models/Message');
const Room = require('../models/Room');
const { findRoomIfMember } = require('./roomService');

const SENDER_PUBLIC_FIELDS = 'username avatarUrl';

// возвращает { ok: true, message } либо { ok: false, status, message: текст ошибки }
async function createMessage({ roomId, senderId, text }) {
    if (!text || !text.trim()) {
        return { ok: false, status: 400, error: 'Пустое сообщение' };
    }

    const room = await findRoomIfMember(roomId, senderId);
    if (!room) {
        return { ok: false, status: 403, error: 'Нет доступа к этой комнате' };
    }

    const message = await Message.create({
        room: roomId,
        sender: senderId,
        text: text.trim(),
    });

    room.lastMessage = {
        text: message.text,
        sender: senderId,
        createdAt: message.createdAt,
    };

    room.participants.forEach((p) => {
        const participantId = p.user.toString();
        if (participantId === senderId) return;

        const current = room.unreadCount.get(participantId) || 0;
        room.unreadCount.set(participantId, current + 1);
    });

    await room.save();
    await message.populate('sender', SENDER_PUBLIC_FIELDS);

    return { ok: true, message };
}

// actorId — кто выполнил действие (для 'participant_left' совпадает с targetId)
// targetId — над кем выполнено действие
async function createSystemMessage({ roomId, action, actorId, targetId }) {
    const message = await Message.create({
        room: roomId,
        sender: actorId,
        type: 'system',
        systemData: { action, target: targetId },
    });

    await message.populate('sender', SENDER_PUBLIC_FIELDS);
    await message.populate('systemData.target', SENDER_PUBLIC_FIELDS);

    // обновляем превью комнаты
    await Room.findByIdAndUpdate(roomId, {
        lastMessage: {
            sender: actorId,
            createdAt: message.createdAt,
            type: 'system',
            systemAction: action,
            systemActorUsername: message.sender.username,
            systemTargetUsername: message.systemData.target.username,
        },
    });

    return message;
}

async function markMessagesAsRead({ roomId, userId }) {
    await Message.updateMany(
        { room: roomId, readBy: { $ne: userId }, isDeleted: false },
        { $addToSet: { readBy: userId } },
    );
}

module.exports = { createMessage, createSystemMessage, markMessagesAsRead, SENDER_PUBLIC_FIELDS };