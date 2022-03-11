--INDEX for name column in Artist table
CREATE INDEX  IX_Artist_name  
ON	Artist (fullName); 

--INDEX for capacity column in Venue table
CREATE INDEX IX_Venue_capacity
ON Venue (capacity);

--INDEX for venueId column in Event table 
CREATE INDEX IX_FK_Event_venueId
ON Event (venueId);

--INDEX for artistId column in Artist_Event
CREATE INDEX IX_FK1_Artist_Event_artistId
ON Artist_Event (artistId);

--INDEX for eventId column in Artist_Event
CREATE INDEX IX_FK2_Artist_Event_eventId
ON Artist_Event (eventId);

--INDEX for eventId column in Booking
CREATE INDEX IX_FK1_Booking_eventId
ON Booking (eventId);

--INDEX for clientPhoneNo column in Booking
CREATE INDEX IX_FK2_Booking_clientPhoneNo
ON Booking (clientPhoneNo);

--INDEX for bookingDate column in Booking
CREATE INDEX IX_bookingDate_bookingDate
ON Booking (bookingDate);
