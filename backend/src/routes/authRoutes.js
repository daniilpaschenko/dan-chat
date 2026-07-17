const router = require('express').Router();
const { register, login } = require('../controllers/authController');
const authMiddleware = require('../middlewares/auth'); // для защищённых роутов

router.post('/register', register);
router.post('/login', login);

module.exports = router;