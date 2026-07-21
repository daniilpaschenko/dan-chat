const express = require('express');

const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const roomRoutes = require('./routes/roomRoutes');

const { globalLimiter } = require('./middlewares/rateLimiters');
const errorHandler = require('./middlewares/errorHandler');

const app = express();

app.use(express.json());

// rate-limiting на все роуты
app.use('/api', globalLimiter);

// роуты
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);
app.use('/api/rooms', roomRoutes);

// в самом конце всегда
app.use(errorHandler);

module.exports = app;