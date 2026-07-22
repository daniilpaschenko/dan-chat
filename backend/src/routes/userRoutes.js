const router = require('express').Router();
const { getMe, uploadAvatar } = require('../controllers/userController');
const authMiddleware = require('../middlewares/auth'); // для защищённых роутов
const upload = require('../middlewares/upload');

router.get('/me', authMiddleware, getMe);
// .single() потому что только 1 аватарку можно загрузить
router.post('/me/avatar', authMiddleware, upload.single('avatar'), uploadAvatar);

module.exports = router;