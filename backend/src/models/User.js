const mongoose = require("mongoose");
const Schema = mongoose.Schema;

// массив токенов устройств пользователя
const deviceTokenSchema = new Schema({
    token: { type: String, required: true },
    platform: { type: String, enum: ['ios', 'android', 'web'], required: true },
    updatedAt: { type: Date, default: Date.now },
}, { _id: false });

const userSchema = new Schema({
    username: {
        type: String,
        required: true,
        unique: true,
        trim: true,
    },
    email: {
        type: String,
        required: true,
        unique: true,
        trim: true,
        lowercase: true,
    },
    passwordHash: {
        type: String,
        required: true,
    },
    avatarUrl: {
        type: String,
        default: null,
    },
    avatarPublicId: { // для удаления старой аватарки
        type: String,
        default: null,
    },
    status: {
        type: String,
        enum: ["online", "offline"],
        default: "offline", // логичнее поставить offline
    },
    lastSeen: {
        type: Date,
        default: Date.now,
    },
    deviceTokens: {
        type: [deviceTokenSchema],
        default: [],
    },
}, {
    timestamps: true, 
    toJSON: {
        transform: (doc, ret) => {
            ret.id = ret._id.toString();
            delete ret._id;
            delete ret.__v;
            delete ret.passwordHash; // удаляем passwordHash
            delete ret.deviceTokens; // не отдаём токены
            return ret;
        },
    },
}
);

module.exports = mongoose.model("User", userSchema);