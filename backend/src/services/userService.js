const Room = require('../models/Room');

// достаём id всех "контактов" юзера — тех, с кем у него есть общие комнаты
async function getContactIds(userId) {
    // все комнаты пользователя
    const rooms = await Room.find({ 'participants.user': userId }).select('participants.user');
    const ids = new Set(); // Set чтобы не было дубликатов
    rooms.forEach((room) => { // перебираем все комнаты
        room.participants.forEach((p) => { // и всех участников комнат
            const id = p.user.toString(); // получаем айди каждого юзера
            if (id !== userId) ids.add(id); // если айди != айди текущего юзера, то добавляем
        });
    });
    return [...ids]; // преобразует сет обратно в массив
}

module.exports = { getContactIds };