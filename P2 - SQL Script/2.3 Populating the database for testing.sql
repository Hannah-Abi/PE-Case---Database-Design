-- 2.3 populating the database for testing
-- Database populating------------------------------------
-- Artist table
INSERT INTO Artist(artistId, fullName, phone, email, specialRequests) VALUES
(1, 'Land del Reys', 44123456789, 'landdelreys@email.com', 'Must be an abundance of kittens on arrival.'),
(2, 'Doja Cat', 44213456789, 'dojacat@email.com', 'Will not work without garlic.'),
(3, 'Olivia Rodrigo', 44313456789, 'oliviarodrigo@email.com', 'Must supply hazmat suit with christmas lights inside'),
(4, '50 Pence', 44413456789, '50pence@email.com', '1 Private security guard/chef/clown.'),
(5, 'Dua Lipa', 44513456789, 'duo.lipa@email.com', 'at least three Private security guard/chef/clown.')
-- Venue table
INSERT INTO Venue(venueId, venueName, capacity) VALUES
(1, 'Paisley Thunder Dome', 120),
(2, 'Paisley Hall', 600),
(3, 'Paisley Arena', 1200)
-- Client table
INSERT INTO Client(phoneNo) VALUES
(44993456789),
(44983456789),
(44973456789),
(44963456789),
(44913456789), 
(44923456789), 
(44933456789),
(44943456789), 
(44953456789) 
-- Event table
INSERT INTO Event(eventId, eventName, eventDate, price, status, venueId) VALUES
(1, 'Annual Farmers Market/Rap Battle', '2022-01-25', 29.99, 'O', 1),
(2, 'Yorkshire Yodelling', '2022-02-25', 19.99, 'O', 2),
(3, 'Dog Boxing', '2022-03-25', 39.99, 'O', 3),
(4, 'Huge superstar comes to Paisley', '2022-04-25', 39.99, 'C', 3),
(5, 'Stormbringer 2022', '2022-06-02', 19.99, 'O', 2)
-- Booking table
INSERT INTO Booking(bookingNo, bookingDate, expireDate, noOfTickets, bookingStatus, eventId, clientPhoneNo) VALUES
(1,'2022-01-01', '2022-01-04', 1, 'B', 1, 44993456789), 
(2,'2022-01-07', '2022-01-10', 3, 'P', 2, 44983456789), 
(3,'2022-01-15', '2022-01-18', 5, 'P', 2, 44973456789), 
(4,'2022-01-20', '2022-01-23', 3, 'P', 3, 44963456789),
(5,'2022-01-02', '2022-01-05', 1, 'B', 1, 44913456789), 
(6,'2022-01-02', '2022-01-05', 1, 'B', 1, 44923456789), 
(7,'2022-01-02', '2022-01-05', 1, 'B', 3, 44933456789),
(8,'2022-01-02', '2022-01-05', 1, 'R', 4, 44943456789), 
(9,'2022-01-16', '2022-01-20', 1, 'R', 4, 44953456789),
(10,'2022-01-01', '2022-01-04', 1, 'P', 5, 44963456789), 
(11,'2022-01-15', '2022-01-18', 1, 'P', 5, 44973456789) 
--bookingStatus: 'B' is booked, 'P' is purchased, 'R' is refund, 'C' is cancelled
-- Artist_Event table
INSERT INTO Artist_Event(artistId, eventId) VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 3),
(5, 1),
(5, 5)
-- TOOLBOX ------------------------------------
--Deletes All rows
/*
DELETE FROM Booking
DELETE FROM Artist_Event
DELETE FROM Event
DELETE FROM Artist
DELETE FROM Venue
DELETE FROM Client
*/
-- View all rows
/*
SELECT * FROM Artist
SELECT * FROM Venue
SELECT * FROM Event
SELECT * FROM Artist_Event
SELECT * FROM Client
SELECT * FROM Booking
*/