const express = require('express');
const bodyParser = require('body-parser');
const path = require('path')
const mongoose = require('mongoose');
const userRoutes = require('./routes/user');
const db = require("../config/db");
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use('/', userRoutes); 
// MongoDB Setup

const ImageLocation = db.model('ImageLocation', {
  imageUrl: String,
  latitude: Number,
  longitude: Number,
});

app.listen(3600, () => {
  console.log(`Server is running on port 3600`);
});