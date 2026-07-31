const { findRoomIfMember } = require('../services/roomService');
const { createMessage } = require('../services/messageService');

// io.emit() — событие получат все подключённые клиенты, независимо от комнат
// io.to(roomId).emit() — событие получат все пользователи roomId
// socket.to(roomId).emit() — событие получат все, кроме текущего пользователя
// socket.emit() — событие получит только сам сокет-отправитель

module.exports = function registerChatHandlers(io, socket) {
    // получаем id пользователя
    // (благодаря тому, что в socketAuth написали socket.user = user, теперь можно обращаться вот так)
    const userId = socket.user._id.toString();

    
    socket.on('room:join', async (roomId, callback) => {
        try {
            const room = await findRoomIfMember(roomId, userId);
            if (!room) return callback?.({ ok: false, message: 'Нет доступа к комнате' });
            // сокет добавляется в группу roomId
            socket.join(roomId);
            callback?.({ ok: true });
        } catch (err) {
            console.error('room:join error:', err);
            callback?.({ ok: false, message: 'Ошибка сервера' });
        }
    });

    socket.on('room:leave', (roomId) => {
        // сокет больше не состоит в группе roomId
        socket.leave(roomId);
    });

    socket.on('message:send', async (data, callback) => {
        try {
            // разбираем присланные данные на roomId и text
            const { roomId, text } = data || {};
            // создаём сообщение
            const result = await createMessage({ roomId, senderId: userId, text });
            if (!result.ok) {
                return callback?.({ ok: false, message: result.error });
            }

            // эмиттим событие 'message:new' всем пользователям комнаты
            // тот же формат, что отдаёт REST POST /rooms/:roomId/messages
            io.to(roomId).emit('message:new', result.message.toJSON());
            callback?.({ ok: true, message: result.message.toJSON() });
        } catch (err) {
            console.error('message:send error:', err);
            callback?.({ ok: false, message: 'Ошибка сервера' });
        }
    });

    socket.on('typing:start', ({ roomId }) => {
        if (!roomId) return;
        // событие всем, кроме текущего пользователя
        socket.to(roomId).emit('typing:start', {
            roomId,
            userId,
            username: socket.user.username,
        });
    });

    socket.on('typing:stop', ({ roomId }) => {
        if (!roomId) return;
        // событие всем, кроме текущего пользователя
        socket.to(roomId).emit('typing:stop', { roomId, userId });
    });
};