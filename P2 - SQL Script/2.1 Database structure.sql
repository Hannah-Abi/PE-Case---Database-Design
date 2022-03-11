CREATE TABLE Artist
(
 artistId			INTEGER			NOT NULL,
 fullName			VARCHAR(50)		NOT NULL,
 phone				VARCHAR(15)		NOT NULL,
 email				VARCHAR(50)		NOT NULL,
 specialRequests	VARCHAR(200), 

 CONSTRAINT PK_Artist PRIMARY KEY(artistId), 
 CONSTRAINT AK_Artist_phone UNIQUE (phone),
 CONSTRAINT AK_Artist_email UNIQUE (email)
); 

CREATE TABLE Venue
(
 venueId			INTEGER			NOT NULL,
 venueName			VARCHAR(50)		NOT NULL,
 capacity			INTEGER			NOT NULL, 

 CONSTRAINT PK_Venue PRIMARY KEY (venueId), 
 CONSTRAINT AK_Venue UNIQUE (venueName)
);

CREATE TABLE Event
(
 eventId			INTEGER			NOT NULL,
 eventName			VARCHAR(50)		NOT NULL,
 eventDate			DATE			NOT NULL, 
 price				DECIMAL(4,2)	NOT NULL,
 status				CHAR(1)			NOT NULL,
 venueId			INTEGER			NOT NULL, 

 CONSTRAINT PK_Event			PRIMARY KEY (eventId),
 CONSTRAINT FK_Event_venueId	FOREIGN KEY (venueId) REFERENCES Venue(venueId), 
 CONSTRAINT CHK_Event_status	CHECK (status = 'O' OR status = 'C') -- 'O' is ongoing and 'C' is cancelled
); 

CREATE TABLE Artist_Event
(
 artistId			INTEGER			NOT NULL, 
 eventId			INTEGER			NOT NULL, 

 CONSTRAINT PK_Artist_Event		PRIMARY KEY (artistId, eventId), 
 CONSTRAINT FK1_Artist_Event		FOREIGN KEY (artistId) REFERENCES Artist(artistId), 
 CONSTRAINT FK2_Artist_Event		FOREIGN KEY (eventId) REFERENCES Event(eventId)
);

CREATE TABLE Client
(
 phoneNo			VARCHAR(15)		NOT NULL,

 CONSTRAINT PK_Client PRIMARY KEY (phoneNo)
); 

CREATE TABLE Booking 
(
 bookingNo			INTEGER			NOT NULL, 
 bookingDate		DATE			NOT NULL, 
 expireDate			DATE			NOT NULL,
 noOfTickets		INTEGER			NOT NULL, 
 bookingStatus		CHAR(1)			NOT NULL,
 eventId			INTEGER			NOT NULL,
 clientPhoneNo		VARCHAR(15)		NOT NULL,

 CONSTRAINT PK_Booking PRIMARY KEY (bookingNo),
 CONSTRAINT FK1_Booking FOREIGN KEY (eventId)		REFERENCES Event(eventId), 
 CONSTRAINT FK2_Booking FOREIGN KEY (clientPhoneNo) REFERENCES Client(phoneNo),
 CONSTRAINT CHK_Booking_bookingStatus CHECK (bookingStatus = 'B' OR bookingStatus = 'P' OR bookingStatus = 'R' OR bookingStatus = 'C')
 -- 'B' is booked 
 -- 'P' is purchased 
 -- 'R' is refund
 -- 'C' is cancel
);

-- DROP TABLE Booking
-- DROP TABLE Event
-- DROP TABLE Artist
-- DROP TABLE Artist_Event
-- DROP TABLE Venue
-- DROP TABLE Client