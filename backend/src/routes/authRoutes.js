const router = require('express').Router();
const { register, login, refresh, logout } = require('../controllers/authController');
const authMiddleware = require('../middlewares/auth'); // для защищённых роутов
const {loginLimiter, registerLimiter} = require('../middlewares/rateLimiters'); // подключение лимитеров

router.post('/register', registerLimiter, register);
router.post('/login', loginLimiter, login);
router.post('/refresh', refresh);
router.post('/logout', logout);

module.exports = router;