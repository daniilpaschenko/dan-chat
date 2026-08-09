const express = require('express');
const cookieParser = require('cookie-parser');
const cors = require('cors');

const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const roomRoutes = require('./routes/roomRoutes');

const { globalLimiter } = require('./middlewares/rateLimiters');
const errorHandler = require('./middlewares/errorHandler');

const app = express();

app.use(cors({
    origin: process.env.CLIENT_URL || '*', 
    credentials: true, // разрешить отправку/приём cookies
}));

app.use(express.json());
app.use(cookieParser());

// rate-limiting на все роуты
app.use('/api', globalLimiter);

// роуты
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/rooms', roomRoutes);

// в самом конце всегда
app.use(errorHandler);

module.exports = app;