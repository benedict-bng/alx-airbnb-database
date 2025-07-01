-- database_index.sql

-- Index on users.user_id
CREATE INDEX idx_users_user_id ON users(user_id);

-- Index on bookings.user_id
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.booking_date (optional for sorting/filtering)
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Index on properties.property_id
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Optional: index on properties.location for faster search
CREATE INDEX idx_properties_location ON properties(location);


-- Example: Analyze performance of a JOIN query
EXPLAIN ANALYZE
SELECT 
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id;
