-- partitioning.sql

-- Step 1: Create a partitioned bookings table
CREATE TABLE bookings_partitioned (
    booking_id     INT PRIMARY KEY,
    user_id        INT NOT NULL,
    property_id    INT NOT NULL,
    start_date     DATE NOT NULL,
    end_date       DATE,
    booking_date   DATE,
    INDEX (start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);


EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
