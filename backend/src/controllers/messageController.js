const mongoose = require('mongoose');
const Room = require('../models/Room');
const Message = require('../models/Message');
const { createMessageSchema } = require('../validators/messageValidator');

// проверяет что юзер состоит в комнате, возвращает комнату или null
async function findRoomIfMember(roomId, userId) {
    const room = await Room.findById(roomId);
    if (!room) return null;

    const isMember = room.participants.some((p) => p.user.toString() === userId);
    if (!isMember) return null;

    return room;
}

// GET /rooms/:roomId/messages?before=<messageId>&limit=30
// курсорная пагинация: отдаём сообщения СТАРШЕ курсора, от новых к старым, поэтому
// на фронте нужно вставлять новые чаты в начало массива
exports.getRoomMessages = async (req, res) => {
    try {
        const myId = req.user.id;
        const { roomId } = req.params;
        const { before } = req.query;

        // 30 по умолчанию, не больше 100 за раз чтобы не положить базу
        const limit = Math.min(parseInt(req.query.limit, 10) || 30, 100);

        const room = await findRoomIfMember(roomId, myId);
        if (!room) return res.status(403).json({ message: 'Нет доступа к этой комнате' });

        const query = { room: roomId };

        if (before) { // если есть предыдущий запрос
            if (!mongoose.Types.ObjectId.isValid(before)) {
                return res.status(400).json({ message: 'Некорректный курсор' });
            }
            query._id = { $lt: before }; // сообщения, созданные раньше
        }

        // берём limit+1 чтобы понять есть ли ещё страница, не считая documents отдельно
        const messages = await Message.find(query)
            .sort({ _id: -1 }) // от новых к старым
            .limit(limit + 1) // на 1 сообщение больше, чем нужно отдать
            .populate('sender', 'username avatarUrl')
            .lean();

        const hasMore = messages.length > limit; // есть ли больше сообщений
        const page = hasMore ? messages.slice(0, limit) : messages;
        const nextCursor = hasMore ? page[page.length - 1]._id : null; // айди последнего сообщения (станет потом before)

        return res.json({
            messages: page.reverse(), // отдаём от старых к новым
            nextCursor,
            hasMore,
        });
    } catch (err) {
        console.error('getRoomMessages error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// POST /rooms/:roomId/messages
exports.createMessage = async (req, res) => {
    try {
        const { error, value } = createMessageSchema.validate(req.body);
        if (error) {
            return res.status(400).json({ message: error.details[0].message });
        }

        const myId = req.user.id;
        const { roomId } = req.params;
        const { text } = value;

        const room = await findRoomIfMember(roomId, myId);
        if (!room) return res.status(403).json({ message: 'Нет доступа к этой комнате' });

        const message = await Message.create({
            room: roomId,
            sender: myId,
            text,
        });

        // обновляем превью последнего сообщения
        room.lastMessage = {
            text,
            sender: myId,
            createdAt: message.createdAt,
        };

        // инкремент unread всем, кроме отправителя
        room.participants.forEach((p) => {
            const participantId = p.user.toString();
            if (participantId === myId) return;

            const current = room.unreadCount.get(participantId) || 0;
            room.unreadCount.set(participantId, current + 1);
        });

        await room.save();

        const populated = await message.populate('sender', 'username avatarUrl');

        return res.status(201).json(populated);
    } catch (err) {
        console.error('createMessage error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};