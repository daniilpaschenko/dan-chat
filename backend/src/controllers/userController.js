const User = require('../models/User');

exports.getMe = async (req, res) => {
    res.json({ user: req.user });
};