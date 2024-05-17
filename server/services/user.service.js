const UserModel = require('../model/user.model');
const jwt = require('jsonwebtoken');
const logger = require('../logger'); // Adjust the path as needed

class UserService {
    static async registerUser(email, password) {
        try {
            logger.info(`Registering user: ${email}`);
            const createUser = new UserModel({ email, password });
            return await createUser.save();
        } catch (err) {
            logger.error(`Error registering user: ${err.stack}`);
            throw err;
        }
    }

    static async getUserByEmail(email) {
        try {
            return await UserModel.findOne({ email });
        } catch (err) {
            logger.error(`Error fetching user by email: ${err.stack}`);
            throw err;
        }
    }

    static async checkUser(email) {
        try {
            return await UserModel.findOne({ email });
        } catch (error) {
            logger.error(`Error checking user: ${error.stack}`);
            throw error;
        }
    }

    static async generateAccessToken(tokenData, secretKey, jwt_expire) {
        try {   
            return jwt.sign(tokenData, secretKey, { expiresIn: jwt_expire });
        } catch (error) {
            logger.error(`Error generating access token: ${error.stack}`);
            throw error;
        }
    }
}

module.exports = UserService;
