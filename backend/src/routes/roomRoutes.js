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
    updateParticipantRole,
    leaveRoom,
    deleteRoom,
} = require('../controllers/roomController');
const { getRoomMessages, createMessage } = require('../controllers/messageController');


router.use(authMiddleware);

router.post('/', createRoom);
router.get('/', getMyRooms);
router.get('/:roomId', getRoomById);
router.post('/:roomId/read', markRoomAsRead);
router.post('/:roomId/participants', addParticipant);
router.delete('/:roomId/participants/:userId', removeParticipant);
router.patch('/:roomId/participants/:userId/role', updateParticipantRole);
router.post('/:roomId/leave', leaveRoom);
router.delete('/:roomId', deleteRoom);


router.get('/:roomId/messages', getRoomMessages);
router.post('/:roomId/messages', createMessage);

module.exports = router;