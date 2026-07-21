const Joi = require('joi');

const objectId = Joi.string().hex().length(24);

const createRoomSchema = Joi.object({
    type: Joi.string().valid('direct', 'group').required(),

    // для direct ровно 1 id собеседника, для group >=1
    participantIds: Joi.array().items(objectId).min(1).required(),

    // название обязательно только для группы, для direct вообще не передаём
    name: Joi.string().trim().min(1).max(100).when('type', {
        is: 'group',
        then: Joi.required(),
        otherwise: Joi.forbidden(),
    }),

    avatarUrl: Joi.string().uri().optional(),
});

const addParticipantSchema = Joi.object({
    userId: objectId.required(),
});

module.exports = { createRoomSchema, addParticipantSchema };