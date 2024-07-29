const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');

const app = express();
const port = 3002;

app.use(cors());

// PostgreSQL connection
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'hotel_db',
  password: 'p@stgress',
  port: 5433,
});

// Existing endpoint for hotel data
app.get('/hotel/:hotelSlug', async (req, res) => {
  const { hotelSlug } = req.params;
  console.log(`Request received for hotel slug: ${hotelSlug}`);
  try {
    const result = await pool.query('SELECT * FROM hotel WHERE hotel_slug = $1', [hotelSlug]);
    if (result.rows.length > 0) {
      res.json(result.rows[0]);
    } else {
      res.status(404).json({ error: 'Hotel not found' });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// New endpoint for combined hotel and room data
app.get('/hotel/:hotelSlug/:roomSlug', async (req, res) => {
  const { hotelSlug, roomSlug } = req.params;
  try {
    const query = `
      SELECT h.*, r.*
      FROM hotel h
      JOIN hotel_rooms r ON h.hotel_slug = r.hotel_slug
      WHERE h.hotel_slug = $1 AND r.room_slug = $2
    `;
    const result = await pool.query(query, [hotelSlug, roomSlug]);
    
    if (result.rows.length > 0) {
      // Restructure the data to separate hotel and room information
      const hotelData = {};
      const roomData = {};
      
      for (const [key, value] of Object.entries(result.rows[0])) {
        if (key.startsWith('room_')) {
          roomData[key] = value;
        } else {
          hotelData[key] = value;
        }
      }
      
      res.json({
        hotel: hotelData,
        room: roomData
      });
    } else {
      res.status(404).json({ error: 'Hotel or room not found' });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});