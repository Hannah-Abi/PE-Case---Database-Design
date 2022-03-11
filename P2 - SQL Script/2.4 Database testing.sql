-- 1. Booking tickets

INSERT INTO Client(phoneNo) VALUES
(44903456789)
INSERT INTO Booking(bookingNo, bookingDate, expireDate, noOfTickets, bookingStatus, eventId, clientPhoneNo) VALUES
(12,'2022-01-11', '2022-01-14', 2, 'B', 3, 44903456789)

--2. Changing the number of tickets in a booking
UPDATE Booking SET noOfTickets = 10 WHERE bookingNo = 3

--3. Cancelling a ticket booking
UPDATE Booking SET bookingStatus = 'C' WHERE bookingNo = 5

--4. Changing the status of booking to sold when tickets are purchased(the booking is payed for)
UPDATE Booking SET bookingStatus = 'P' WHERE bookingNo = 7

--5. Removing unpurchased bookings from the database after three days from booking
DELETE FROM Booking WHERE bookingStatus = 'B'  AND expireDate < (SELECT CAST(GETDATE() AS DATE))

--6. Cancelling an event(in an extreme exceptional case)
UPDATE Event SET status = 'C' WHERE eventId = 2

--7.Refunding a client in a case of a cancelled event.
UPDATE Booking SET bookingStatus = 'R' FROM Booking 
JOIN Event ON Booking.eventId = Event.eventId
WHERE bookingStatus = 'P' AND Event.status = 'C'

--8. What is Doja Cat's contact email?
SELECT email FROM Artist WHERE fullName = 'Doja Cat'

--9. How many tickets are there left for Land del Rey's concert on 5.9.2022? 
	-- Check artistId of Land del Reys--
SELECT artistId FROM Artist WHERE fullName = 'Land del Reys' --1--
	-- Calculate the number of tickets available = Capacity - the number of purchsed and booked tickets--
SELECT (SELECT SUM(Venue.capacity) FROM Venue
JOIN Event ON Event.venueId = Venue.venueId
JOIN Artist_Event ON Event.eventId = Artist_Event.eventId
WHERE Artist_Event.artistId = 1) - (SELECT COUNT(bookingStatus) FROM Booking
JOIN Artist_Event ON Artist_Event.eventId = Booking.eventId
WHERE (bookingStatus = 'B' OR bookingStatus = 'P') AND Booking.eventId = (SELECT Artist_Event.eventId WHERE artistId = 1))


--10. What dance performances are coming up this month? 
SELECT Event.eventName, Event.eventDate FROM Event 
WHERE eventDate <  EOMONTH (GETDATE(),0) AND eventDate > GETDATE()

--11. When will Olivia Rodrigo perform in Paisley and what are her special requests for catering?
SELECT Event.eventDate, Artist.specialRequests FROM Event
JOIN Artist_Event ON (Artist_Event.eventId = Event.eventId)
JOIN Artist ON ( Artist.artistId = Artist_Event.artistId)
WHERE Artist.fullName = 'Olivia Rodrigo' AND Event.eventDate > (SELECT CAST(GETDATE() AS DATE))

--12 How many tickets have been sold this far to Dua Lipa's dance performance ''Stormbringer 2022" that takes place on 2.6.2022?
SELECT COUNT(*) AS "Duo Lipa Show" FROM Booking 
JOIN Artist_Event ON (Artist_Event.eventId = Booking.eventId)
JOIN Artist	ON (Artist.artistId = Artist_Event.artistId)
WHERE Artist.fullName = 'Dua Lipa' AND Booking.bookingStatus = 'P'

--13 How much money has the Paisley Event Association got from sold tickets this year?
WITH TempTable(price, noOfTickets)
AS (SELECT E1.price, COUNT(B1.bookingStatus)
FROM Event as E1
JOIN Booking AS B1 ON (E1.eventId = B1.eventId)
WHERE B1.bookingStatus = 'P' 
GROUP BY E1.price)
SELECT SUM(price*noOfTickets) AS "Total"
FROM TempTable

-- 14 Which artist has sold the highest number of tickets this year. Please notice that the artist can have performed several times this year. All the artist's performances count here.
WITH TempT (artistId, noOfTickets)
AS ( SELECT AE.artistId, COUNT(B1.bookingStatus)
FROM Artist_Event AS AE
JOIN Booking AS B1 ON (B1.eventId = AE.eventId)
GROUP BY AE.artistId)
SELECT Artist.fullName AS "The arist with the best selling show" FROM Artist
JOIN TempT ON (Artist.artistId = TempT.artistId)
WHERE TempT.noOfTickets = (SELECT max(noOfTickets) FROM TempT)
