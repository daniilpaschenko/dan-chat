const Joi = require("joi");

const registerSchema = Joi.object({
    username: Joi.string()
        .trim()
        .min(3) // минимум 3
        .max(16) // максимум 16
        .alphanum() // только буквы и цифры
        .required(),

    email: Joi.string()
        .trim()
        .lowercase()
        .email()
        .required(),

    password: Joi.string()
        .min(8) // минимум 8 символов
        .max(24) // до 24 символов
        .required(),
});

const loginSchema = Joi.object({
    email: Joi.string()
        .trim()
        .lowercase()
        .email()
        .required(),

    password: Joi.string()
        .required(),
});

module.exports = { registerSchema, loginSchema };