# Hotel Data API

This is a Node.js API built with Express that connects to a PostgreSQL database to manage hotel and room data. The API provides endpoints to retrieve information about hotels and specific rooms within those hotels.

## Overview

This API allows you to fetch hotel and room data from a PostgreSQL database.

## Requirements

- Node.js
- PostgreSQL
- Express

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Database Setup](#database-setup)
- [Error Handling](#error-handling)

## Installation
NODEJS
- mkdir project-directory
- cd project-directory
- npm init -y
- npm install express pg bcrypts body-parser cors 

PostgreSQL
Set up the PostgreSQL database. Ensure you have PostgreSQL installed and running. Create a database named hotel_db and configure the connection in the code.
- db connection: \c hotel_db

## Usage
1. Start the server: nodemon index.js
(The server will run on http://localhost:3002.)
   
## API Endpoints
1. Get Hotel Data
   -Endpoint: GET /hotel/:hotelSlug
   -Description: Retrieves data for a specific hotel based on the hotelSlug.
   -Response:
      - 200 OK with hotel data.
      - 404 Not Found if the hotel is not found.
      - 500 Internal Server Error for server issues.
2. Get Combined Hotel and Room Data
   - Endpoint: GET /hotel/:hotelSlug/:roomSlug
   - Description: Retrieves combined data for a specific hotel and room based on the hotelSlug and roomSlug.
   - Response:
      -200 OK with hotel and room data.
      -404 Not Found if the hotel or room is not found.
      -500 Internal Server Error for server issues.

## Database Setup
Ensure you have PostgreSQL installed and running. The database should contain the necessary tables (hotel and hotel_rooms) with appropriate schema to store the hotel and room data. The queries for tables can be found in database.sql file.

## Error Handling
Errors are handled with appropriate HTTP status codes and messages:

-200 OK: Successful request.
-404 Not Found: Data not found for the requested resource.
-500 Internal Server Error: An unexpected server error occurred.

You can also check the API response sing Postman/Thunder.

## Notes
1. Ensure that the PostgreSQL database is properly set up and the connection details in the code match your setup.
2. You may need to adjust the table schemas and fields based on your specific requirements.
