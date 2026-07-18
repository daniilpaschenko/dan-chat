const mongoose = require('mongoose');

const refreshTokenSchema = new mongoose.Schema({
    tokenHash: { 
        type: String,
        required: true,
        unique: true
    },
    userId: { 
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    expiresAt: {
        type: Date, 
        required: true 
    },
    revoked: { // отозван ли токен (при ротации/logout)
        type: Boolean,
        default: false 
    },
    replacedByHash: {
        type: String,
        default: null // хэш токена, которым заменён (для трекинга цепочки)
    },
    createdAt: { 
        type: Date, 
        default: Date.now 
    },
});

// MongoDB САМ удалит документ, когда наступит expiresAt
refreshTokenSchema.index({ expiresAt: 1 }, { expireAfterSeconds: 0 });

module.exports = mongoose.model('RefreshToken', refreshTokenSchema);