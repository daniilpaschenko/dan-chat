const express = require('express');
const router = express.Router();
const authMiddleware = require('../middlewares/auth');
const {
    createRoom,
    getMyRooms,
    getRoomById,
    markRoomAsRead,
    addParticipant,
    removeParticipant,
} = require('../controllers/roomController');


router.use(authMiddleware);

router.post('/', createRoom);
router.get('/', getMyRooms);
router.get('/:roomId', getRoomById);
router.post('/:roomId/read', markRoomAsRead);
router.post('/:roomId/participants', addParticipant);
router.delete('/:roomId/participants/:userId', removeParticipant);

module.exports = router;