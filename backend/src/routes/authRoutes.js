const router = require('express').Router();
const { register, login } = require('../controllers/authController');
const authMiddleware = require('../middlewares/auth'); // для защищённых роутов
const {loginLimiter, registerLimiter} = require('../middlewares/rateLimiters'); // подключение лимитеров

router.post('/register', registerLimiter, register);
router.post('/login', loginLimiter, login);

module.exports = router;