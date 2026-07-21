const mongoose = require("mongoose");
const Schema = mongoose.Schema;

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
        default: "online",
    },
    lastSeen: {
        type: Date,
        default: Date.now,
    },
}, {
    timestamps: true, 
    toJSON: {
        transform: (doc, ret) => {
            ret.id = ret._id.toString();
            delete ret._id;
            delete ret.__v;
            delete ret.passwordHash; // удаляем passwordHash
            return ret;
        },
    },
}
);

module.exports = mongoose.model("User", userSchema);