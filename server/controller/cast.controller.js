const CastService = require("../services/cast.service");

exports.createCast = async (req, res, next) => {
    try {
        const {id,
            name,
            surname,
            imgUrl,
            role,
            description} = req.body;

        let cast = await CastService.createCast(
            id,
            name,
            surname,
            imgUrl,
            role,
            description
        );

        res.json({ status: true, success: cast });
    } catch(e) {
        next(e);
    }
};

exports.getCast = async (req, res, next) => {
    try {
        const {id} = req.body;

        let cast = await CastService.getCastData(
            id
        );

        res.json({ status: true, success: cast });
    } catch(e) {
        next(e);
    }
};