const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  userName: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    unique: true,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  deviceToken: {
    type: String,
  },
  systems: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "System",
    },
  ],
  notifications: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Notifications",
    },
  ],
});

const User = mongoose.model("User", userSchema);

module.exports = User;
