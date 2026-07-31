require('dotenv').config();
const http = require('http');
const app = require('./src/app');
const connectDB = require('./src/config/db');
// автоматически воспримет как './src/sockets/index'
const initSocket = require('./src/sockets');

const PORT = process.env.PORT || 3000;

const server = http.createServer(app);

const io = initSocket(server);
app.set('io', io); // чтобы при желании достучаться до io из REST-контроллеров (req.app.get('io'))

connectDB().then(() => {
    server.listen(PORT, () => {
        console.log(`Server running at http://localhost:${PORT}`);
    });
});