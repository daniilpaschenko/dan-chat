const { Server } = require('socket.io');
const socketAuth = require('./socketAuth');
const registerChatHandlers = require('./chatHandlers');
const { handleConnect, handleDisconnect } = require('./presence');

// сюда будет передаваться обычный HTTP-сервер
// socket.io работает поверх обычного HTTP-сервера
module.exports = function initSocket(server) {
    // создаём объект socket.io
    const io = new Server(server, {
        // для веба. возможно буду его собирать, так что пусть будет пока что
        cors: {
            // разрешает подключение только с клиента
            origin: process.env.CLIENT_URL,
            credentials: true,
        },
    });

    // перед каждым новым подключением вызываем миддлвар аутентификации
    io.use(socketAuth);
    // сюда попадают только авторизованные юзеры
    io.on('connection', async (socket) => {
        // логируем подключение
        // socket.id автоматически создаётся сервисом socket.io
        console.log(`Socket connected: ${socket.user.username} (${socket.id})`);
        
        // событие подключения (presence.js)
        await handleConnect(io, socket);
        // подключаем обработчики событий — сервер начинает слушать юзера
        registerChatHandlers(io, socket);

        // если отключился
        socket.on('disconnect', async () => {
            // логируем отключение
            console.log(`Socket disconnected: ${socket.user.username} (${socket.id})`);
            // событие отключения (presence.js)
            await handleDisconnect(io, socket);
        });
    });

    return io;
};