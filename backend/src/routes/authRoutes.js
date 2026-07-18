const router = require('express').Router();
const { register, login, refresh } = require('../controllers/authController');
const authMiddleware = require('../middlewares/auth'); // для защищённых роутов
const {loginLimiter, registerLimiter} = require('../middlewares/rateLimiters'); // подключение лимитеров

router.post('/register', registerLimiter, register);
router.post('/login', loginLimiter, login);
router.post('/refresh', refresh);

module.exports = router;