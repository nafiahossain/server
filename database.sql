create database hotel_db; --dbname is hotel_db

CREATE TABLE hotel (
    hotel_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    images TEXT[], 
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    host_name VARCHAR(255) NOT NULL,
    host_description TEXT,
    guest_count INTEGER,
    room_count INTEGER,
    amenities TEXT[],
    address TEXT,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    house_rules TEXT[],
    safety_and_property TEXT[],
    hotel_slug VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE hotel_rooms (
    room_id SERIAL PRIMARY KEY,
    room_title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    guest_count INTEGER,
    bedroom_count INTEGER,
    bed_count INTEGER,
    bathroom_count INTEGER,
    images TEXT[], 
    room_slug VARCHAR(255) UNIQUE NOT NULL,
    hotel_slug VARCHAR(255) REFERENCES hotel(hotel_slug) ON DELETE CASCADE
);


-- Insert data into the hotel table
INSERT INTO hotel (name, images, title, description, host_name, host_description, guest_count, room_count, amenities, address, latitude, longitude, house_rules, safety_and_property, hotel_slug)
VALUES 
(
    'Luxury Hotel',
    ARRAY['images/hotel1.jpg', 'images/hotel2.jpg'], 
    'Luxury Hotel in the Heart of the City',
    'Experience luxury and comfort in our centrally located hotel. Enjoy a range of amenities and services designed for a relaxing stay.',
    'James',
    'Hello world! I love traveling and I also love welcoming guests in my home country, Perú, meeting new people.',
    100,
    10,
    ARRAY['Pool', 'Gym', 'Spa', 'Free WiFi', 'Restaurant'],  
    '123 Main Street, Lima, Peru',
    -12.0464,  
    -77.0428,  
    ARRAY['Check-in after 3:00 PM', 'Checkout before 11:00 AM'],  
    ARRAY['No smoking', 'No pets allowed'],  
    'luxury-hotel'  
);


-- Insert another hotel into the hotel table
INSERT INTO hotel (name, images, title, description, host_name, host_description, guest_count, room_count, amenities, address, latitude, longitude, house_rules, safety_and_property, hotel_slug)
VALUES 
(
    'Seaside Retreat',
    ARRAY['database_images/sea1.jpg', 'database_images/seaside2.jpg', 'database_images/sea1.jpg', 'database_images/sea1.jpg', 'database_images/sea1.jpg', 'database_images/sea1.jpg', 'database_images/sea1.jpg', 'database_images/sea1.jpg', 'database_images/sea1.jpg'],  
    'Charming Seaside Retreat with Ocean Views',
    'Enjoy a peaceful stay at our seaside retreat. Located just steps from the beach, our hotel offers stunning ocean views and cozy accommodations.Located just steps from the beach, our hotel offers stunning ocean views and cozy accommodations.',
    'Laura',
    'Very passionate about seaside living and love sharing this beautiful spot with our guests. Welcome to a retreat like no other!',
    80,
    30,
    ARRAY['Ocean View', 'Free Breakfast', 'Beach Access', 'WiFi', 'Pool', 'Gym', 'Spa', 'Free WiFi', 'Restaurant', 'Kitchen', 'TV', 'Elevator', 'Washer', 'Dryer', 'Hair dryer', 'Refrigerator' ],  
    '456 Ocean Drive, Lima, Peru',
    -12.0456,  
    -77.0355,  
    ARRAY['Check-in after 2:00 PM', 'Checkout before 12:00 PM', '2 guests maximum'],  
    ARRAY['Carbon monooxide alarm not reported', 'No parties allowed', 'Pets allowed upon request'],  
    'seaside-retreat'  
);


-- Insert data for additional rooms into the hotel_rooms table
INSERT INTO hotel_rooms (room_title, description, guest_count, bedroom_count, bed_count, bathroom_count, images, room_slug, hotel_slug)
VALUES 
(
    'Oceanfront Suite',
    'Luxurious suite with breathtaking ocean views, a private balcony, and elegant furnishings. Ideal for a romantic getaway.',
    2,
    1,
    1,
    1,
    ARRAY['database_images/searoom2.jpg', 'database_images/searoom3.jpeg', 'database_images/searoom1.jpg'],  
    'oceanfront-suite',  
    'seaside-retreat'  
),
(
    'Beachside Cabin',
    'Cozy cabin located right by the beach, perfect for a laid-back stay with a touch of charm and comfort.',
    4,
    2,
    2,
    1,
    ARRAY['database_images/searoom6.jpg', 'database_images/searoom10.jpeg', 'database_images/searoom11.jpeg'],  
    'beachside-cabin',  
    'seaside-retreat'  
),
(
    'Deluxe Beachside Suite',
    'Spacious deluxe suite with a king-size bed, modern amenities, and a beautiful beachside view. Perfect for a luxurious stay.',
    2,
    1,
    1,
    1,
    ARRAY['database_images/searoom6.jpg', 'database_images/searoom10.jpeg', 'database_images/searoom11.jpeg'],  
    'deluxe-beachside-suite',  
    'seaside-retreat'  
),
(
    'Executive Oceanfront Room',
    'Elegant executive room with premium furnishings, a queen-size bed, and excellent facilities. Ideal for business travelers.',
    2,
    1,
    1,
    1,
    ARRAY['database_images/searoom2.jpg', 'database_images/searoom3.jpeg', 'database_images/searoom1.jpg'],  
    'executive-oceanfront-room',  
    'seaside-retreat'  
),
(
    'Standard Cabin',
    'Comfortable standard room with basic amenities and a cozy atmosphere. Suitable for budget-conscious travelers.',
    2,
    1,
    1,
    1,
    ARRAY['database_images/searoom6.jpg', 'database_images/searoom10.jpeg', 'database_images/searoom11.jpeg'],  
    'standard-cabin',  
    'seaside-retreat'  
);
