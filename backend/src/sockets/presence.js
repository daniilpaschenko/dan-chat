const User = require('../models/User');
const Room = require('../models/Room');
const { getContactIds } = require('../services/userService');

// сколько сокетов сейчас держит каждый юзер
// например: '1' -> 2 означает что пользователь '1' держит 2 сокета (устройства)
const activeConnections = new Map(); // userId -> count

// оповещает контактов пользователя о его присутствии
async function broadcastPresence(io, userId, status, lastSeen) {
    // получаем контакты пользователя
    const contacts = await getContactIds(userId);
    contacts.forEach((contactId) => { // для каждого контакта
        // отправить всем его устройствам событие 'presence:update'
        io.to(`user:${contactId}`).emit('presence:update', {
            userId,
            status,
            // при оповещении о том, что юзер онлайн, не будет поля lastSeen
            // так что делаем его опциональным
            ...(lastSeen ? { lastSeen } : {}), 
        });
    });
}

// вызывается, когда пользователь подключился
async function handleConnect(io, socket) {
    const userId = socket.user._id.toString();

    // персональная комната юзера, добавляем его сокет в эту комнату
    socket.join(`user:${userId}`);
    
    // присоединяем сокет ко всем комнатам пользователя сразу при коннекте
    // иначе message:new/typing доходят только пока открыт конкретный чат
    const rooms = await Room.find({ 'participants.user': userId }).select('_id');
    rooms.forEach((room) => socket.join(room._id.toString()));

    // количество предыдущих подключений
    const prevCount = activeConnections.get(userId) || 0;
    // т.к. прямо сейчас подключились, то +1 подключение
    activeConnections.set(userId, prevCount + 1);

    // если до этого ни одного устройства юзера не было подключено
    if (prevCount === 0) {
        // переводим его статус в онлайн
        await User.findByIdAndUpdate(userId, { status: 'online' });
        // оповещаем контактов что он онлайн
        await broadcastPresence(io, userId, 'online');
    }
}

async function handleDisconnect(io, socket) {
    const userId = socket.user._id.toString();

    // количество предыдущих подключений
    const prevCount = activeConnections.get(userId) || 0;
    // т.к. прямо сейчас отключились, то -1 подключение
    // защита от отрицательного числа
    const newCount = Math.max(prevCount - 1, 0);

    // если стало 0
    if (newCount === 0) {
        // удаляем запись для юзера — он полностью отключился
        activeConnections.delete(userId);
    } else {
        // иначе показываем новое число подключений, которое >=1
        activeConnections.set(userId, newCount);
    }

    // в offline переводим только когда 0 устройств юзера
    if (newCount === 0) {
        // считаем время его последней активности
        const lastSeen = new Date();
        await User.findByIdAndUpdate(userId, { status: 'offline', lastSeen });
        // тут уже записываем lastSeen
        await broadcastPresence(io, userId, 'offline', lastSeen);
    }
}

module.exports = { handleConnect, handleDisconnect };