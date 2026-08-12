const Room = require('../models/Room');
const { createRoomSchema, addParticipantSchema, updateParticipantRoleSchema } = require('../validators/roomValidator');
const { findRoomIfMember, getParticipant, formatRoomForUser } = require('../services/roomService');
const { createSystemMessage } = require('../services/messageService');

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
        const io = req.app.get('io');

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
                // для однообразного поведения
                await existing.populate('participants.user', 'username avatarUrl status lastSeen');
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
            await room.populate('participants.user', 'username avatarUrl status lastSeen');

            // уведомляем ОБОИХ участников, включая создателя — иначе у него
            // новый чат появится в списке только после ручного refresh
            [myId, otherId].forEach((id) => {
                io.in(`user:${id}`).socketsJoin(room.id);
                io.to(`user:${id}`).emit('room:created', formatRoomForUser(room, id));
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
        // populate чтобы сделать однообразное поведения для удобства на фронтенде
        await room.populate('participants.user', 'username avatarUrl status lastSeen');

        [myId, ...otherIds].forEach((id) => {
            io.in(`user:${id}`).socketsJoin(room.id);
            io.to(`user:${id}`).emit('room:created', formatRoomForUser(room, id));
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

        // unreadCount у нас Map<userId, count> — отдаём фронту только счётчик текущего юзера
        const formatted = rooms.map((room) => {
            const json = room.toJSON();
            json.unreadCount = room.unreadCount.get(myId) || 0;
            return json;
        });

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

        const room = await findRoomIfMember(roomId, myId);

        // не вскрываем существование чужих комнат
        if (!room) return res.status(403).json({ message: 'Нет доступа к этой комнате' });

        await room.populate('participants.user', 'username avatarUrl status lastSeen');
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

        const room = await findRoomIfMember(roomId, myId);
        if (!room) return res.status(403).json({ message: 'Нет доступа к этой комнате' });

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
        const io = req.app.get('io');

        const room = await findRoomIfMember(roomId, myId);
        if (!room) return res.status(403).json({ message: 'Нет доступа к этой комнате' });
        if (room.type !== 'group') {
            return res.status(400).json({ message: 'Добавлять участников можно только в групповой чат' });
        }

        const me = getParticipant(room, myId);
        if (!['owner', 'admin'].includes(me.role)) {
            return res.status(403).json({ message: 'Недостаточно прав' });
        }

        const alreadyIn = room.participants.some((p) => p.user.toString() === userId);
        if (alreadyIn) return res.status(400).json({ message: 'Пользователь уже в чате' });

        room.participants.push({ user: userId, role: 'member' });
        await room.save();
        // populate чтобы сделать однообразное поведения для удобства на фронтенде
        await room.populate('participants.user', 'username avatarUrl status lastSeen');

        // системное сообщение "X добавил(а) Y" — видно всем участникам, включая нового
        const systemMessage = await createSystemMessage({
            roomId,
            action: 'participant_added',
            actorId: myId,
            targetId: userId,
        });

        // новому участнику — комната появляется в списке чатов, как при создании
        io.in(`user:${userId}`).socketsJoin(room.id);
        io.to(`user:${userId}`).emit('room:created', formatRoomForUser(room, userId));

        // остальным участникам — обновляем данные комнаты (счётчик участников и т.д.)
        room.participants.forEach((p) => {
            const pid = p.user._id.toString();
            if (pid === userId) return; // ему уже отправили room:created выше
            io.to(`user:${pid}`).emit('room:updated', formatRoomForUser(room, pid));
        });

        // эмитим сообщение ПОСЛЕ socketsJoin — чтобы сокет нового участника уже был в комнате
        io.to(roomId).emit('message:new', systemMessage.toJSON());

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
        const io = req.app.get('io');

        const room = await findRoomIfMember(roomId, myId);
        if (!room) return res.status(403).json({ message: 'Нет доступа к этой комнате' });
        if (room.type !== 'group') {
            return res.status(400).json({ message: 'Операция доступна только для группового чата' });
        }

        const me = getParticipant(room, myId);
        const isSelf = userId === myId;
        const canManage = ['owner', 'admin'].includes(me.role);

        if (!isSelf && !canManage) {
            return res.status(403).json({ message: 'Недостаточно прав' });
        }

        room.participants = room.participants.filter((p) => p.user.toString() !== userId);

        await room.save();
        // populate чтобы сделать однообразное поведения для удобства на фронтенде
        await room.populate('participants.user', 'username avatarUrl status lastSeen');

        // системное сообщение — до того как кикнутый сокет покинет комнату,
        // чтобы оставшиеся участники увидели его сразу
        const systemMessage = await createSystemMessage({
            roomId,
            action: isSelf ? 'participant_left' : 'participant_removed',
            actorId: myId, // при isSelf это тот же userId
            targetId: userId,
        });
        io.to(roomId).emit('message:new', systemMessage.toJSON());

        // кикнутому — комната пропадает из списка
        // отключаем его сокеты от комнаты, которой для него больше не существует
        io.to(`user:${userId}`).emit('room:deleted', { roomId });
        io.in(`user:${userId}`).socketsLeave(roomId);

        // оставшимся участникам — обновляем список участников (кто-то ушёл/кикнут)
        room.participants.forEach((p) => {
            const pid = p.user._id.toString();
            io.to(`user:${pid}`).emit('room:updated', formatRoomForUser(room, pid));
        });

        return res.json(room);
    } catch (err) {
        console.error('removeParticipant error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

// PATCH /rooms/:roomId/participants/:userId/role
// body: { role: 'admin'|'member' }
// повысить участника до admin/понизить обратно до member
// только owner, только в group, роль owner'а менять нельзя (и самого себя тоже)
exports.updateParticipantRole = async (req, res) => {
    try {
        const { error, value } = updateParticipantRoleSchema.validate(req.body);
        if (error) {
            // обязательно return чтобы код дальше не выполнился
            return res.status(400).json({ message: error.details[0].message });
        }

        const myId = req.user.id;
        const { roomId, userId } = req.params;
        const { role } = value;
        const io = req.app.get('io');

        const room = await findRoomIfMember(roomId, myId);
        if (!room) return res.status(403).json({ message: 'Нет доступа к этой комнате' });
        if (room.type !== 'group') {
            return res.status(400).json({ message: 'Роли доступны только в групповом чате' });
        }

        const me = getParticipant(room, myId);
        if (me.role !== 'owner') {
            return res.status(403).json({ message: 'Недостаточно прав' });
        }

        if (userId === myId) {
            return res.status(400).json({ message: 'Нельзя менять свою собственную роль' });
        }

        const target = getParticipant(room, userId);
        if (!target) {
            return res.status(404).json({ message: 'Пользователь не найден в этой комнате' });
        }
        if (target.role === 'owner') {
            return res.status(400).json({ message: 'Нельзя менять роль владельца' });
        }

        if (target.role === role) {
            // уже нужная роль — не считаем ошибкой, просто отдаём комнату как есть
            await room.populate('participants.user', 'username avatarUrl status lastSeen');
            return res.json(room);
        }

        target.role = role;
        await room.save();
        // populate чтобы сделать однообразное поведения для удобства на фронтенде
        await room.populate('participants.user', 'username avatarUrl status lastSeen');

        // системное сообщение "X повысил(а)/понизил(а) Y"
        const systemMessage = await createSystemMessage({
            roomId,
            action: role === 'admin' ? 'participant_promoted' : 'participant_demoted',
            actorId: myId,
            targetId: userId,
        });
        io.to(roomId).emit('message:new', systemMessage.toJSON());

        // уведомляем всех участников об изменении роли
        room.participants.forEach((p) => {
            const pid = p.user._id.toString();
            io.to(`user:${pid}`).emit('room:updated', formatRoomForUser(room, pid));
        });

        return res.json(room);
    } catch (err) {
        console.error('updateParticipantRole error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

exports.leaveRoom = async (req, res) => {
    try {
        const myId = req.user.id;
        const { roomId } = req.params;
        const io = req.app.get('io');

        const room = await findRoomIfMember(roomId, myId);
        if (!room) return res.status(403).json({ message: 'Нет доступа к этой комнате' });

        room.participants = room.participants.filter((p) => p.user.toString() !== myId);

        // удалить пустую комнату
        if (room.participants.length === 0) {
            await room.deleteOne();
            io.to(`user:${myId}`).emit('room:deleted', { roomId });
            io.in(`user:${myId}`).socketsLeave(roomId);
            return res.json({ message: 'Комната удалена' });
        }

        // системное сообщение — пока сокет ещё в комнате, чтобы оставшиеся увидели
        const systemMessage = await createSystemMessage({
            roomId,
            action: 'participant_left',
            actorId: myId,
            targetId: myId,
        });
        io.to(roomId).emit('message:new', systemMessage.toJSON());

        await room.save();
        await room.populate('participants.user', 'username avatarUrl status lastSeen');

        // себе (другим устройствам) — комнаты больше нет в списке
        io.to(`user:${myId}`).emit('room:deleted', { roomId });
        io.in(`user:${myId}`).socketsLeave(roomId);

        // оставшимся участникам — обновляем список участников (кто-то вышел)
        room.participants.forEach((p) => {
            const pid = p.user._id.toString();
            io.to(`user:${pid}`).emit('room:updated', formatRoomForUser(room, pid));
        });

        return res.json({ message: 'Вы вышли из комнаты' });
    } catch (err) {
        console.error('leaveRoom error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};

exports.deleteRoom = async (req, res) => {
    try {
        const myId = req.user.id;
        const { roomId } = req.params;
        const io = req.app.get('io');

        const room = await findRoomIfMember(roomId, myId);
        if (!room) return res.status(403).json({ message: 'Нет доступа к этой комнате' });

        const me = getParticipant(room, myId);

        if (room.type == 'group') {
            // только owner
            if (me.role !== 'owner') {
                return res.status(403).json({ message: 'Только владелец может удалить чат' });
            }
        }
        
        const participantIds = room.participants.map((p) => p.user.toString());
        await room.deleteOne();

        // уведомляем всех участников (включая себя — на случай второго устройства)
        // и отключаем их сокеты от комнаты, которой больше не существует
        participantIds.forEach((id) => {
            io.to(`user:${id}`).emit('room:deleted', { roomId });
            io.in(`user:${id}`).socketsLeave(roomId);
        });

        return res.json({ message: 'Комната удалена' });
    } catch (err) {
        console.error('deleteRoom error:', err);
        return res.status(500).json({ message: 'Внутренняя ошибка сервера' });
    }
};