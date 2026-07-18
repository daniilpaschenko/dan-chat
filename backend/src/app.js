const express = require('express');
const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const globalLimiter = require('./middlewares/rateLimiters');
const app = express();

app.use(express.json());
app.use('/api', globalLimiter); // общая защита на все API-роуты
app.use('/api/auth', authRoutes);
app.use('/api/users', userRoutes);

module.exports = app;