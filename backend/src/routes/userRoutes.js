const router = require('express').Router();
const {
    getMe,
    uploadAvatar,
    searchUsers,
    getUserById,
    saveDeviceToken,
    removeDeviceToken,
} = require('../controllers/userController');
const authMiddleware = require('../middlewares/auth'); // для защищённых роутов
const upload = require('../middlewares/upload');

router.get('/me', authMiddleware, getMe);
// .single() потому что только 1 аватарку можно загрузить
router.post('/me/avatar', authMiddleware, upload.single('avatar'), uploadAvatar);

router.get('/search', authMiddleware, searchUsers);

router.post('/device-token', authMiddleware, saveDeviceToken);
router.delete('/device-token', authMiddleware, removeDeviceToken);

// динамический маршрут последним
router.get('/:userId', authMiddleware, getUserById);

module.exports = router;