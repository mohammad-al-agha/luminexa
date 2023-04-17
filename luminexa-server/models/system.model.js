const mongoose = require("mongoose");
const ledSchema = require("./led.model");
const modesSchema = require("./mode.model");

const scheduleSchema = new mongoose.Schema({
  scheduleTitle: {
    type: String,
    required: true,
  },
  time: {
    type: Date,
    required: true,
  },
  repeat: {
    type: [
      {
        type: String,
        enum: [
          "monday",
          "tuesday",
          "wednesday",
          "thursday",
          "friday",
          "saturday",
          "sunday",
        ],
      },
    ],
    default: [],
  },
  scheduleStatus: {
    type: String,
    enum: ["on", "off"],
    default: "on",
  },
});

const systemSchema = new mongoose.Schema({
  systemName: {
    type: String,
    required: true,
  },
  serialNumber: {
    type: String,
    unique: true,
    required: true,
  },
  leds: [ledSchema],
  lastManual: [ledSchema],
  modes: [modesSchema],
  schedules: [scheduleSchema],
  users: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  ],
});

const System = mongoose.model("System", systemSchema);

module.exports = System;
