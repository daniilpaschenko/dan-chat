const mongoose = require('mongoose');
const { Schema, model } = mongoose;

// схема участника комнаты
const participantSchema = new Schema(
    {
        user: {
            type: Schema.Types.ObjectId,
            ref: 'User',
            required: true,
        },
        role: {
            type: String,
            enum: [
                'owner', // создатель комнаты
                'admin', // может кикать, добавлять участников и т.д.
                'member' // обычный чел
            ],
            default: 'member',
        },
        joinedAt: {
            type: Date,
            default: Date.now,
        },
    },
    { _id: false } // отключение автогенерации т.к. не будет использоваться
);

// превью последнего сообщения
const lastMessageSchema = new Schema(
    {
        text: { type: String },
        sender: { type: Schema.Types.ObjectId, ref: 'User' },
        createdAt: { type: Date },
    },
    { _id: false } // отключение автогенерации т.к. не будет использоваться
);

// сама схема комнаты
const roomSchema = new Schema(
    {
        type: {
            type: String,
            enum: ['direct', 'group'], // директ и группа соответственно
            required: true,
        },

        // для group — отображаемое имя чата
        // для direct имя на фронте должно вычисляться из второго участника
        name: {
            type: String,
            trim: true,
            default: null,
        },

        avatarUrl: {
            type: String,
            default: null,
        },

        participants: {
            type: [participantSchema],
            validate: {
                validator(arr) {
                    return arr.length >= 2;
                },
                message: 'В комнате должно быть минимум 2 участника',
            },
        },

        createdBy: {
            type: Schema.Types.ObjectId,
            ref: 'User',
            required: true,
        },

        lastMessage: {
            type: lastMessageSchema,
            default: null,
        },

        // инкремент при новом сообщении для всех, кроме отправителя
        // обнуляем при заходе пользователя в комнату / прочтении.
        unreadCount: {
            type: Map,
            of: Number,
            default: {},
        },
    },
    {
        timestamps: true, // чтобы фильтровать чаты по приходящим сообщениям
        toJSON: {
            transform: (doc, ret) => {
                ret.id = ret._id.toString();
                delete ret._id;
                delete ret.__v;
                return ret;
            },
        },
    }
);

// быстрый поиск "мои комнаты"
roomSchema.index({ 'participants.user': 1 }); // по полю user

// для direct удобно быстро находить существующую комнату между двумя людьми,
// чтобы не плодить дубликаты при повторном "написать пользователю".
roomSchema.index({ type: 1, 'participants.user': 1 }); // сначала direct`ы, потом по полю user

module.exports = model('Room', roomSchema);