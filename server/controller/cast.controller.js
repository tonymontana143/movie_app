const Cast = require('../model/cast_model');

exports.createCast = async (req, res) => {
  try {
    const { id, name, surname, imgUrl, role, description } = req.body;
    const cast = new Cast({ id, name, surname, imgUrl, role, description });
    await cast.save();
    res.status(201).json(cast);
  } catch (err) {
    console.error('Error creating cast:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

exports.getCasts = async (req, res) => {
  try {
    const casts = await Cast.find();
    res.status(200).json(casts);
  } catch (err) {
    console.error('Error fetching casts:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

exports.updateCast = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, surname, imgUrl, role, description } = req.body;
    const cast = await Cast.findByIdAndUpdate(id, { name, surname, imgUrl, role, description }, { new: true });
    if (!cast) {
      return res.status(404).json({ message: 'Cast not found' });
    }
    res.status(200).json(cast);
  } catch (err) {
    console.error('Error updating cast:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

exports.deleteCast = async (req, res) => {
  try {
    const { id } = req.params;
    const cast = await Cast.findByIdAndDelete(id);
    if (!cast) {
      return res.status(404).json({ message: 'Cast not found' });
    }
    res.status(200).json({ message: 'Cast deleted successfully' });
  } catch (err) {
    console.error('Error deleting cast:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};
