const mongoose = require('mongoose');
const { Schema, model } = mongoose;

// под-схема для прикреплённого файла к сообщению
const attachmentSchema = new Schema(
    {
        url: { type: String, required: true },
        type: {
            type: String,
            enum: ['image', 'file'],
            default: 'file',
        },
        name: { type: String },
        size: { type: Number }, // в байтах
    },
    { _id: false }
);

const messageSchema = new Schema(
    {
        room: {
            type: Schema.Types.ObjectId,
            ref: 'Room',
            required: true,
        },

        sender: {
            type: Schema.Types.ObjectId,
            ref: 'User',
            required: true,
        },

        text: {
            type: String,
            trim: true,
            default: '',
        },

        attachments: {
            type: [attachmentSchema],
            default: [],
        },

        // кто прочитал (список людей)
        readBy: {
            type: [{ type: Schema.Types.ObjectId, ref: 'User' }],
            default: [],
        },

        editedAt: {
            type: Date,
            default: null,
        },

        // soft delete — сообщение остаётся,
        // но помечается удалённым и текст на фронте заменяется на "сообщение удалено"
        isDeleted: {
            type: Boolean,
            default: false,
        },
    },
    { timestamps: true }
);

// главный индекс под историю чата: выборка по комнате + сортировка по дате
messageSchema.index({ room: 1, createdAt: -1 });

// курсорная пагинация у нас идёт по _id: room + _id < cursor
messageSchema.index({ room: 1, _id: -1 });

// на случай выборки "мои сообщения"
messageSchema.index({ sender: 1 });

module.exports = model('Message', messageSchema);