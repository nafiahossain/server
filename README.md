# Hotel Data API

This is a Node.js API built with Express that connects to a PostgreSQL database to manage hotel and room data. The API provides endpoints to retrieve information about hotels and specific rooms within those hotels.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Database Setup](#database-setup)
- [Error Handling](#error-handling)

## Installation
NODEJS
mkdir project-directory
cd project-directory
npm init -y
npm install express pg bcrypts body-parser cors 

PostgreSQL
Set up the PostgreSQL database. Ensure you have PostgreSQL installed and running. Create a database named hotel_db and configure the connection in the code.
db connection: \c hotel_db

## Usage
1. Start the server: nodemon index.js
(The server will run on http://localhost:3002.)
   
## API Endpoints
1. Get Hotel Data
Endpoint: GET /hotel/:hotelSlug
Description: Retrieves data for a specific hotel based on the hotelSlug.
Response:
200 OK with hotel data.
404 Not Found if the hotel is not found.
500 Internal Server Error for server issues.
2. Get Combined Hotel and Room Data
Endpoint: GET /hotel/:hotelSlug/:roomSlug
Description: Retrieves combined data for a specific hotel and room based on the hotelSlug and roomSlug.
Response:
200 OK with hotel and room data.
404 Not Found if the hotel or room is not found.
500 Internal Server Error for server issues.
