const express = require("express");
const app = express();
require("dotenv").config();

app.listen(process.env.PORT, (error) => {
  if (error) console.error(error);
  console.log(`Server Running on Port ${process.env.PORT}`);
});