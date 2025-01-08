CREATE TABLE buses (
    bus_id NUMBER PRIMARY KEY,               
    bus_number VARCHAR2(20) NOT NULL,         
    capacity NUMBER(3) NOT NULL,            
    type VARCHAR2(50),                       
    driver_name VARCHAR2(100),               
    driver_contact VARCHAR2(15)              
);

INSERT INTO buses (bus_id, bus_number, capacity, type, driver_name, driver_contact)
VALUES (1, 'ABC123', 40, 'AC', 'John Doe', '1234567890');

INSERT INTO buses (bus_id, bus_number, capacity, type, driver_name, driver_contact)
VALUES (2, 'XYZ456', 30, 'Non-AC', 'Jane Smith', '0987654321');
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE routes (
    route_id NUMBER PRIMARY KEY,             
    source VARCHAR2(100) NOT NULL,            
    destination VARCHAR2(100) NOT NULL,       
    distance NUMBER(5,2) NOT NULL             
);

INSERT INTO routes (route_id, source, destination, distance)
VALUES (1, 'New York', 'Boston', 300.50);

INSERT INTO routes (route_id, source, destination, distance)
VALUES (2, 'Los Angeles', 'San Francisco', 500.75);
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE schedules (
    schedule_id NUMBER PRIMARY KEY,           -- Schedule ID
    bus_id NUMBER,                            -- Bus ID (foreign key)
    route_id NUMBER,                          -- Route ID (foreign key)
    departure_time TIMESTAMP NOT NULL,        -- Departure time (date + time)
    arrival_time TIMESTAMP,                   -- Arrival time
    days_of_operation VARCHAR2(50),           -- Days the bus operates (e.g., "Mon-Sun")
    FOREIGN KEY (bus_id) REFERENCES buses(bus_id),        -- Reference to Buses table
    FOREIGN KEY (route_id) REFERENCES routes(route_id)   -- Reference to Routes table
);

INSERT INTO schedules (schedule_id, bus_id, route_id, departure_time, arrival_time, days_of_operation)
VALUES (1, 1, 1, TO_TIMESTAMP('2025-01-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Mon-Sun');

INSERT INTO schedules (schedule_id, bus_id, route_id, departure_time, arrival_time, days_of_operation)
VALUES (2, 2, 2, TO_TIMESTAMP('2025-01-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2025-01-15 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Mon-Sun');
--------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE passengers (
    passenger_id NUMBER PRIMARY KEY,          -- Passenger ID
    name VARCHAR2(100) NOT NULL,               -- Passenger name
    contact_number VARCHAR2(15) NOT NULL,      -- Contact number
    email VARCHAR2(100),                       -- Email address
    address VARCHAR2(200)                      -- Home address
);

INSERT INTO passengers (passenger_id, name, contact_number, email, address)
VALUES (1, 'Alice Johnson', '5551234567', 'alice.johnson@example.com', '123 Elm St, New York');

INSERT INTO passengers (passenger_id, name, contact_number, email, address)
VALUES (2, 'Bob Martin', '5559876543', 'bob.martin@example.com', '456 Oak St, Boston');
-------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE bookings (
    booking_id NUMBER PRIMARY KEY,             -- Booking ID
    passenger_id NUMBER,                       -- Passenger ID (foreign key)
    schedule_id NUMBER,                        -- Schedule ID (foreign key)
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Booking date
    seats_booked NUMBER(3),                    -- Number of seats booked
    total_amount NUMBER(10, 2),                -- Total amount for the booking
    status VARCHAR2(20) DEFAULT 'Pending',     -- Booking status (e.g., "Pending", "Confirmed", "Cancelled")
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id), -- Reference to Passengers table
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id)   -- Reference to Schedules table
);

INSERT INTO bookings (booking_id, passenger_id, schedule_id, seats_booked, total_amount)
VALUES (1, 1, 1, 2, 100.00);

INSERT INTO bookings (booking_id, passenger_id, schedule_id, seats_booked, total_amount)
VALUES (2, 2, 2, 1, 50.00);
------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM buses;
SELECT * FROM routes;
SELECT * FROM schedules;
SELECT * FROM passengers;
SELECT * FROM bookings;
-----------------------------------------------------------------------------------------------------------------------------------------------
SELECT b.booking_id, p.name, p.contact_number, s.departure_time, s.arrival_time
FROM bookings b
JOIN passengers p ON b.passenger_id = p.passenger_id
JOIN schedules s ON b.schedule_id = s.schedule_id;
------------------------------------------------------------------------------------------------------------------------------------------------
