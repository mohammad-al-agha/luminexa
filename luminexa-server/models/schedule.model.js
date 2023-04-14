const mongoose = require("mongoose");

const scheduleSchema = new mongoose.Schema({
  scheduleTitle: {
    type: String,
    required: true,
  },
  time: {
    type: Date,
    required: true,
  },
  scheduleRepeat: {
    type: Date,
  },
});

const Schedule = mongoose.model("Schedule", scheduleSchema);

module.exports = Schedule;