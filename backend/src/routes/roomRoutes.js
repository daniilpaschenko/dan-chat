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
const { getRoomMessages, createMessage } = require('../controllers/messageController');


router.use(authMiddleware);

router.post('/', createRoom);
router.get('/', getMyRooms);
router.get('/:roomId', getRoomById);
router.post('/:roomId/read', markRoomAsRead);
router.post('/:roomId/participants', addParticipant);
router.delete('/:roomId/participants/:userId', removeParticipant);

router.get('/:roomId/messages', getRoomMessages);
router.post('/:roomId/messages', createMessage);

module.exports = router;