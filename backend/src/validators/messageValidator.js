const Joi = require('joi');

const createMessageSchema = Joi.object({
    // пока что максиум будет 300 символов
    text: Joi.string().trim().min(1).max(300).required(),
});

module.exports = { createMessageSchema };