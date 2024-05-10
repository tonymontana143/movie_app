const CastModel = require("../model/cast_model");

class CastService {

    static async createCast(
            id,
            name,
            surname,
            imgUrl,
            role,
            description
    ) {

        const createCast = new CastModel(
            {
            id,
            name,
            surname,
            imgUrl,
            role,
            description
            }
        );

        return await createCast.save();

    }

    static async getCastData(id) {
        const castData = await CastModel.find({
            id
        });



        return castData;
    }

}

module.exports = CastService;
