const Room = require('../models/Room');
const { createRoomSchema, addParticipantSchema } = require('../validators/roomValidator');

// POST /rooms
// body: { type: 'direct'|'group', participantIds: string[], name?, avatarUrl? }
exports.createRoom = async (req, res) => {
    try {
        const { error, value } = createRoomSchema.validate(req.body);
        if (error) {
            // обязательно return чтобы код дальше не выполнился
            return res.status(400).json({ message: error.details[0].message });
        }

        const { type, participantIds, name, avatarUrl } = value;
        const myId = req.user.id;

        const otherIds = [...new Set(participantIds.filter((id) => id !== myId))];

        if (type === 'direct') {
            if (otherIds.length !== 1) {
                return res.status(400).json({ message: 'Для direct-чата нужен ровно один собеседник' });
            }

            const otherId = otherIds[0];

            // дедупликация
            const existing = await Room.findOne({
                type: 'direct',
                'participants.user': { $all: [myId, otherId] },
                $expr: { $eq: [{ $size: '$participants' }, 2] },
            });

            if (existing) {
                return res.status(200).json(existing);
            }

            const room = await Room.create({
                type: 'direct',
                participants: [
                    { user: myId, role: 'owner' },
                    { user: otherId, role: 'member' },
                ],
                createdBy: myId,
            });

            return res.status(201).json(room);
        }

        // type === 'group'
        const participants = [
            { user: myId, role: 'owner' },
            ...otherIds.map((id) => ({ user: id, role: 'member' })),
        ];

        const room = await Room.create({
            type: 'group',
            name,
            avatarUrl: avatarUrl || null,
            participants,
            createdBy: myId,
        });

        return res.status(201).json(room);
    } catch (err) {
        console.error('createRoom error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// GET /rooms
// список комнат пользователя, отсортированный по последней активности
exports.getMyRooms = async (req, res) => {
    try {
        const myId = req.user.id;

        const rooms = await Room.find({ 'participants.user': myId })
            .populate('participants.user', 'username avatarUrl status lastSeen') // 4 нужные поля
            .sort({ updatedAt: -1 }) // чат с недавней активностью будет первым
            .lean(); // вернуть plain js-объекты

        // unreadCount у нас Map<userId, count> — отдаём фронту только счётчик текущего юзера
        const formatted = rooms.map((room) => ({
            ...room, // берём все поля
            unreadCount: room.unreadCount?.[myId] || 0, // возвращаем число непрочитанных сообщений для нашего пользователя
        }));

        return res.json(formatted);
    } catch (err) {
        console.error('getMyRooms error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// GET /rooms/:roomId
// найти комнату по её айди
exports.getRoomById = async (req, res) => {
    try {
        const myId = req.user.id;
        const { roomId } = req.params;

        const room = await Room.findById(roomId).populate(
            'participants.user',
            'username avatarUrl status lastSeen'
        );

        if (!room) return res.status(404).json({ message: 'Комната не найдена' });

        const isMember = room.participants.some((p) => p.user._id.toString() === myId);
        if (!isMember) return res.status(403).json({ message: 'Нет доступа к этой комнате' });

        return res.json(room);
    } catch (err) {
        console.error('getRoomById error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// POST /rooms/:roomId/read
// обнуляет unreadCount текущего пользователя (нужно при открытии чата на фронте)
exports.markRoomAsRead = async (req, res) => {
    try {
        const myId = req.user.id;
        const { roomId } = req.params;

        const room = await Room.findById(roomId);
        if (!room) return res.status(404).json({ message: 'Комната не найдена' });

        const isMember = room.participants.some((p) => p.user.toString() === myId);
        if (!isMember) return res.status(403).json({ message: 'Нет доступа к этой комнате' });

        room.unreadCount.set(myId, 0);
        await room.save();

        return res.json({ unreadCount: 0 });
    } catch (err) {
        console.error('markRoomAsRead error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// POST /rooms/:roomId/participants
// для group, только owner/admin
exports.addParticipant = async (req, res) => {
    try {
        const { error, value } = addParticipantSchema.validate(req.body);
        if (error) {
            // обязательно return чтобы код дальше не выполнился
            return res.status(400).json({ message: error.details[0].message });
        }

        const myId = req.user.id;
        const { roomId } = req.params;
        const { userId } = value;

        const room = await Room.findById(roomId);
        if (!room) return res.status(404).json({ message: 'Комната не найдена' });
        if (room.type !== 'group') {
            return res.status(400).json({ message: 'Добавлять участников можно только в групповой чат' });
        }

        const me = room.participants.find((p) => p.user.toString() === myId);
        if (!me || !['owner', 'admin'].includes(me.role)) {
            return res.status(403).json({ message: 'Недостаточно прав' });
        }

        const alreadyIn = room.participants.some((p) => p.user.toString() === userId);
        if (alreadyIn) return res.status(400).json({ message: 'Пользователь уже в чате' });

        room.participants.push({ user: userId, role: 'member' });
        await room.save();

        return res.json(room);
    } catch (err) {
        console.error('addParticipant error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// DELETE /rooms/:roomId/participants/:userId
// если свой userId в параметре, то выход из чата, чужой - кик (нужны права owner/admin)
exports.removeParticipant = async (req, res) => {
    try {
        const myId = req.user.id;
        const { roomId, userId } = req.params;

        const room = await Room.findById(roomId);
        if (!room) return res.status(404).json({ message: 'Комната не найдена' });
        if (room.type !== 'group') {
            return res.status(400).json({ message: 'Операция доступна только для группового чата' });
        }

        const me = room.participants.find((p) => p.user.toString() === myId);
        if (!me) return res.status(403).json({ message: 'Нет доступа к этой комнате' });

        const isSelf = userId === myId;
        const canManage = ['owner', 'admin'].includes(me.role);

        if (!isSelf && !canManage) {
            return res.status(403).json({ message: 'Недостаточно прав' });
        }

        room.participants = room.participants.filter((p) => p.user.toString() !== userId);

        // если участников осталось меньше 2, то удаляем чат
        if (room.participants.length < 2) {
            await room.deleteOne();
            return res.json({ message: 'Комната удалена (недостаточно участников)' });
        }

        await room.save();
        return res.json(room);
    } catch (err) {
        console.error('removeParticipant error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};