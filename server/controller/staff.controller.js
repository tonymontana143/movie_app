const Staff = require('../model/staff_model');

exports.createStaff = async (req, res) => {
  try {
    const { id, name, surname, imgUrl, role, description } = req.body;
    const staff = new Staff({ id, name, surname, imgUrl, role, description });
    await staff.save();
    res.status(201).json(staff);
  } catch (err) {
    console.error('Error creating staff:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

exports.getStaffs = async (req, res) => {
  try {
    const staffs = await Staff.find();
    res.status(200).json(staffs);
  } catch (err) {
    console.error('Error fetching staffs:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

exports.updateStaff = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, surname, imgUrl, role, description } = req.body;
    const staff = await Staff.findByIdAndUpdate(id, { name, surname, imgUrl, role, description }, { new: true });
    if (!staff) {
      return res.status(404).json({ message: 'Staff not found' });
    }
    res.status(200).json(staff);
  } catch (err) {
    console.error('Error updating staff:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};

exports.deleteStaff = async (req, res) => {
  try {
    const { id } = req.params;
    const staff = await Staff.findByIdAndDelete(id);
    if (!staff) {
      return res.status(404).json({ message: 'Staff not found' });
    }
    res.status(200).json({ message: 'Staff deleted successfully' });
  } catch (err) {
    console.error('Error deleting staff:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
};
