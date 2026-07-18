const router = require('express').Router();
const { getMe } = require('../controllers/userController');
const authMiddleware = require('../middlewares/auth'); // для защищённых роутов

router.get('/me', authMiddleware, getMe);

module.exports = router;