const UserServices = require('../services/user.service');
const logger = require('../logger'); // Adjust the path as needed

exports.register = async (req, res, next) => {
    try {
        logger.info(`Register request body: ${JSON.stringify(req.body)}`);
        const { email, password } = req.body;
        const duplicate = await UserServices.getUserByEmail(email);
        if (duplicate) {
            logger.warn(`UserName ${email} already registered`);
            throw new Error(`UserName ${email}, Already Registered`);
        }
        const response = await UserServices.registerUser(email, password);
        logger.info(`User registered successfully: ${email}`);
        res.json({ status: true, success: 'User registered successfully' });
    } catch (err) {
        logger.error(`Error in register: ${err.stack}`);
        next(err);
    }
};

exports.login = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            logger.warn('Email or password missing in login request');
            throw new Error('Parameter are not correct');
        }
        let user = await UserServices.checkUser(email);
        if (!user) {
            logger.warn(`User does not exist: ${email}`);
            throw new Error('User does not exist');
        }
        const isPasswordCorrect = await user.comparePassword(password);
        if (!isPasswordCorrect) {
            logger.warn(`Username or Password does not match: ${email}`);
            throw new Error(`Username or Password does not match`);
        }

        // Creating Token
        let tokenData = { _id: user._id, email: user.email };
        const token = await UserServices.generateAccessToken(tokenData, "secret", "1h");
        logger.info(`User logged in successfully: ${email}`);
        res.status(200).json({ status: true, success: "sendData", token: token });
    } catch (error) {
        logger.error(`Error in login: ${error.stack}`);
        next(error);
    }
};
