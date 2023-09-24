CREATE DATABASE ABCCinema
GO
USE ABCCinema
GO


CREATE TABLE [Cinemas](
	CinemaID CHAR(5) PRIMARY KEY,
	CinemaName VARCHAR(50) NOT NULL,
	CinemaLocation VARCHAR(50) NOT NULL,
	StudioQty INT NOT NULL
);

CREATE TABLE [Movies](
	MovieID CHAR(5) PRIMARY KEY,
	MovieName VARCHAR(50) NOT NULL,
	MovieImage VARCHAR(50) NOT NULL,
	ProductionHouse VARCHAR(50) NOT NULL,
	Genre VARCHAR(50) NOT NULL,
	ViewingCategory VARCHAR(50) NOT NULL
);

CREATE TABLE [StudioTypes](
	StudioTypeID CHAR(5) PRIMARY KEY,
	StudioTypeName VARCHAR(50) NOT NULL,
	Price FLOAT NOT NULL
);

CREATE TABLE [Studios](
	StudioID CHAR(5) PRIMARY KEY,
	StudioName VARCHAR(50) NOT NULL,
	CinemaID CHAR(5) FOREIGN KEY REFERENCES [Cinemas](CinemaID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StudioTypeID CHAR(5) FOREIGN KEY REFERENCES [StudioTypes](StudioTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Capacity INT NOT NULL
)

CREATE TABLE [Seats](
	SeatID CHAR(5) PRIMARY KEY,
	StudioID CHAR(5) FOREIGN KEY REFERENCES [Studios](StudioID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SeatNumber CHAR(2)
)

CREATE TABLE [ScheduledMovie](
	ScheduledMovieID CHAR(3) PRIMARY KEY CHECK(ScheduledMovieID LIKE '[0-9][0-9][0-9]'),
	MovieID CHAR(5) FOREIGN KEY REFERENCES [Movies](MovieID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StudioID CHAR(5) FOREIGN KEY REFERENCES [Studios](StudioID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TimeStart TIME NOT NULL,
	ShowStartDate DATE NOT NULL,
	ShowEndDate DATE NOT NULL
)

CREATE TABLE [Staff](
	StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'SF[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) NOT NULL,
	StaffType VARCHAR(50) NOT NULL,
	StaffGender VARCHAR(50) NOT NULL
)

CREATE TABLE [StaffPhoneNumber](
	PhoneNumber VARCHAR(12) PRIMARY KEY,
	StaffID CHAR(5) FOREIGN KEY REFERENCES [Staff](StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
)

CREATE TABLE [BookingMovie](
	BookingID CHAR(7) PRIMARY KEY CHECK(BookingID LIKE 'BOK[0-9][0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES [Staff](StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	ScheduledMovieID CHAR(3) FOREIGN KEY REFERENCES [ScheduledMovie](ScheduledMovieID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	DateOfBooking DATE NOT NULL,
	StatusOfPayment VARCHAR(20) NOT NULL
)

CREATE TABLE [PaymentType](
	PaymentTypeID CHAR(2) PRIMARY KEY,
	PaymentTypeName VARCHAR(20)
)

CREATE TABLE [Payment](
	PaymentID CHAR(11) PRIMARY KEY,
	PaymentTypeID CHAR(2) FOREIGN KEY REFERENCES [PaymentType](PaymentTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	BookingID CHAR(7) FOREIGN KEY REFERENCES [BookingMovie](BookingID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	Nominal FLOAT NOT NULL
)

CREATE TABLE [BookingMovieDetails](
	BookingID CHAR(7) FOREIGN KEY REFERENCES [BookingMovie](BookingID)NOT NULL,
	SeatID CHAR(5) FOREIGN KEY REFERENCES [Seats](SeatID),
	PRIMARY KEY (BookingID, SeatID)
)

SELECT * FROM Movies

INSERT INTO [PaymentType] VALUES
('01', 'E-Wallet'),
('02', 'Credit Card'),
('03', 'Debit Card')

INSERT INTO [Staff] VALUES
('SF127', 'Rosi', 'Kasir', 'Male'),
('SF128', 'Rahmat', 'Kasir', 'Male'),
('SF129', 'Ani', 'Kasir', 'Female')

INSERT INTO [Movies] VALUES
('MV001', 'Avengers: Endgame', 'Endgame Pict', 'Marvel', 'Fantasy', 'All Age'),
('MV002', 'Black Panther', 'Black Panther Pict', 'Marvel', 'Fantasy', 'All Age')

INSERT INTO [ScheduledMovie] VALUES
('107', 'MV001', 'ST001', '13:30:00', '2022-01-13', '2022-02-01')

INSERT INTO [StudioTypes] VALUES 
('STP01', 'Regular', 100001)

INSERT INTO [StudioTypes] VALUES 
('STP02', 'Premiere', 150000),
('STP03', 'Platinum', 200000)

INSERT INTO [Cinemas] VALUES
('CN001', 'CGV', 'Jakarta', 7)

INSERT INTO [Studios] VALUES
('ST001','Studio 1','CN001', 'STP01', 100),
('ST002','Studio 2','CN001', 'STP01', 100),
('ST003','Studio 3','CN001', 'STP01', 100),
('ST004','Studio 4','CN001', 'STP01', 100),
('ST005','Studio 5','CN001', 'STP02', 30),
('ST006','Studio 6','CN001', 'STP02', 30),
('ST007','Studio 7','CN001', 'STP03', 20)

INSERT INTO [Seats] VALUES
('SEA01', 'ST001', 'E7'),
('SEA02', 'ST001', 'E8'),
('SEA03', 'ST001', 'D9'),
('SEA04', 'ST001', 'F8'),
('SEA05', 'ST002', 'A8'),
('SEA06', 'ST002', 'A7'),
('SEA07', 'ST002', 'A6'),
('SEA08', 'ST002', 'A5'),
('SEA09', 'ST002', 'B8'),
('SEA10', 'ST002', 'B7'),
('SEA11', 'ST002', 'B6'),
('SEA12', 'ST002', 'B5'),
('SEA13', 'ST002', 'B4')

--1
INSERT INTO [BookingMovie] VALUES
('BOK4803', 'SF127', '107', '2022-01-05', 'Success')


INSERT INTO [Seats] VALUES
('SEA01', 'ST001', 'E7'),
('SEA02', 'ST001', 'E8')

INSERT INTO [BookingMovieDetails] VALUES
('BOK4803', 'SEA01'),
('BOK4803', 'SEA02')

INSERT INTO [Payment] VALUES
('20220105007', '01', 'BOK4803', 100000)

--2
SELECT
BookingID,
[Movie Name] = MovieName,
[Seat Count] = COUNT(SeatID),
[Booking Date] = DateOfBooking,
[Staff In Charge] = StaffName,
[Studio Name] = StudioName
FROM BookingMovie bm
JOIN ScheduledMovie sm ON bm.ScheduledMovieID = sm.ScheduledMovieID
JOIN Movies mv ON sm.MovieID = mv.MovieID
JOIN Studios s ON sm.StudioID = s.StudioName
JOIN Seats se ON s.StudioID = se.StudioID
JOIN Staff sf ON bm.StaffID = sf.StaffID
WHERE MovieName IN ('Avengers: Endgame', 'Black Panther') 
AND ShowStartDate = '2022-01-20'
AND StudioName IN ('Studio 1', 'Studio 2')
GROUP BY MovieName, BookingID, DateOfBooking, StaffName, StudioName
ORDER BY DateOfBooking

SELECT * FROM Studios
--3
SELECT 
[Nama Studio] = StudioName, 
[Kapasitas Studio] = Capacity,
[Jumlah Kursi] = COUNT(SeatID)
FROM Studios s
JOIN Seats se ON s.StudioID = se.StudioID
JOIN ScheduledMovie sm ON s.StudioID = sm.StudioID
JOIN Movies mv ON sm.MovieID = mv.MovieID
WHERE MovieName = 'Avengers: Endgame' AND ShowStartDate = '2021-12-22'
GROUP BY StudioName, Capacity


--4 a
GRANT SELECT ON ABCCinema TO kasir07
GRANT SELECT ON ABCCinema TO bagpenayangan12

--4b
REVOKE SELECT ON ABCCinema TO manager10