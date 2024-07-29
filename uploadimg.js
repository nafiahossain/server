const express = require('express');
const multer = require('multer');
const path = require('path');
const { Pool } = require('pg');


const app = express();
const port = 3003;

// PostgreSQL connection
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'hotel_db',
  password: 'p@stgress',
  port: 5433,
});

// Configure multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // Destination folder
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + path.extname(file.originalname);
    cb(null, file.fieldname + '-' + uniqueSuffix); // File name
  }
});

const upload = multer({ storage: storage });

// Route to upload images and update hotel record
app.post('/upload', upload.single('hotelImage'), async (req, res) => {
  const hotelSlug = req.body.hotelSlug; // Assuming you send the hotelSlug in the request body
  const file = req.file;

  if (!file) {
    return res.status(400).send('No file uploaded');
  }

  try {
    const hotelImagePath = `/uploads/${file.filename}`;

    const client = await pool.connect();
    try {
      const result = await client.query(
        'UPDATE hotel SET images = array_append(images, $1) WHERE hotel_slug = $2 RETURNING hotel_slug',
        [hotelImagePath, hotelSlug]
      );

      if (result.rowCount === 0) {
        return res.status(404).send('Hotel not found');
      }

      res.status(200).json({ message: 'Hotel image uploaded successfully', hotelImagePath });
    } finally {
      client.release();
    }
  } catch (err) {
    console.error('Database error:', err.message);
    res.status(500).send('Server error');
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
