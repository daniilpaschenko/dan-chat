const Message = require('../models/Message');
const Room = require('../models/Room');
const { findRoomIfMember } = require('./roomService');
const { isUserOnline } = require('../sockets/presenceHelper');
const { sendPushToUsers } = require('./pushService');

const SENDER_PUBLIC_FIELDS = 'username avatarUrl';

// возвращает { ok: true, message } либо { ok: false, status, message: текст ошибки }
async function createMessage({ roomId, senderId, text, io }) {
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

    // пуши шлём только тем, кто оффлайн (иначе получат и сокет-событие, и пуш)
    if (io) {
        const offlineRecipients = room.participants
            .map((p) => p.user.toString())
            .filter((id) => id !== senderId && !isUserOnline(io, id));

        if (offlineRecipients.length > 0) {
            // не блокируем ответ пользователю ожиданием отправки пушей
            sendPushToUsers(offlineRecipients, {
                title: room.type == 'direct' ? message.sender.username : room.name,
                body: message.text,
                data: { type: 'message', roomId },
            }).catch((err) => console.error('push send error:', err));
        }
    }

    return { ok: true, message, room };
}

// аналог client-side systemMessageText
function buildSystemMessageBody({ action, actorUsername, targetUsername }) {
    switch (action) {
        case 'participant_added':
            return `${actorUsername} добавил(а) ${targetUsername}`;
        case 'participant_removed':
            return `${actorUsername} удалил(а) ${targetUsername}`;
        case 'participant_left':
            return `${actorUsername} вышел(а) из группы`;
        case 'participant_promoted':
            return `${actorUsername} назначил(а) ${targetUsername} администратором`;
        case 'participant_demoted':
            return `${actorUsername} понизил(а) ${targetUsername} до участника`;
        default:
            return '';
    }
}

// actorId — кто выполнил действие (для 'participant_left' совпадает с targetId)
// targetId — над кем выполнено действие
async function createSystemMessage({ roomId, action, actorId, targetId, io }) {
    const message = await Message.create({
        room: roomId,
        sender: actorId,
        type: 'system',
        systemData: { action, target: targetId },
    });

    await message.populate('sender', SENDER_PUBLIC_FIELDS);
    await message.populate('systemData.target', SENDER_PUBLIC_FIELDS);

    // обновляем превью комнаты
    const room = await Room.findByIdAndUpdate(
        roomId,
        {
            lastMessage: {
                sender: actorId,
                createdAt: message.createdAt,
                type: 'system',
                systemAction: action,
                systemActorUsername: message.sender.username,
                systemTargetUsername: message.systemData.target.username,
            },
        },
        { new: true }, // нужен свежий room.participants ниже
    );

    // пуши шлём только оффлайн-участникам, кроме самого actor'а
    if (io) {
        const offlineRecipients = room.participants
            .map((p) => p.user.toString())
            .filter((id) => id !== actorId && !isUserOnline(io, id));

        if (offlineRecipients.length > 0) {
            const body = buildSystemMessageBody({
                action,
                actorUsername: message.sender.username,
                targetUsername: message.systemData.target.username,
            });

            if (body) {
                sendPushToUsers(offlineRecipients, {
                    title: room.type === 'direct' ? message.sender.username : room.name,
                    body,
                    data: { type: 'message', roomId },
                }).catch((err) => console.error('push send error:', err));
            }
        }
    }

    return message;
}

async function markMessagesAsRead({ roomId, userId }) {
    await Message.updateMany(
        { room: roomId, readBy: { $ne: userId }, isDeleted: false },
        { $addToSet: { readBy: userId } },
    );
}

function buildMessageNewPayload(message, room) {
    return {
        ...message.toJSON(),
        roomType: room.type,
        roomName: room.type === 'group' ? room.name : undefined,
    };
}

module.exports = { createMessage, createSystemMessage, markMessagesAsRead, buildMessageNewPayload, SENDER_PUBLIC_FIELDS };