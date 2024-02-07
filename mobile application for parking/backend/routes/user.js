const express = require('express');
const multer = require('multer');
const path = require('path')
const router = express.Router();

const storage = multer.diskStorage({
    destination: function(req,file,cb){
        cb(null,"uploads");
    },
    filename: function(req, file, cb){
        cb(null, Date.now()+'-'+file.originalname);
    }
});

const upload = multer({storage:storage});

app.post('/upload', async (req, res) => {
  const { imageUrl, latitude, longitude } = req.body;
  const imageLocation = new ImageLocation({
    imageUrl,
    latitude: parseFloat(latitude),
    longitude: parseFloat(longitude),
  });

  try {
    await imageLocation.save();
    res.status(200).send('Data saved successfully');
  } catch (error) {
    res.status(500).send('Error saving data');
  }
});

module.exports = router;

