CREATE DATABASE SembuhSelalu
GO
USE SembuhSelalu
GO


--1
CREATE TABLE [MsPatient] (
	PatientID CHAR(5) PRIMARY KEY,
	PatientName VARCHAR(255) NOT NULL,
	PatientAddress VARCHAR (255) NOT NULL,
	PatientPhone VARCHAR(15),
	PatientBirthDate DATE NOT NULL
)

CREATE TABLE [MsDoctor](
	DoctorID CHAR(5) PRIMARY KEY,
	DoctorName VARCHAR(255) NOT NULL,
	DoctorAddress VARCHAR (255) NOT NULL,
	DoctorPhone VARCHAR(15),
	DoctorBirthDate DATE NOT NULL
)

CREATE TABLE [MsMedicineType](
	MedicineTypeID CHAR(5) PRIMARY KEY,
	MedicineTypeName VARCHAR(255) NOT NULL
)

CREATE TABLE [MsMedicine] (
	MedicineID CHAR(5) PRIMARY KEY,
	MedicineTypeID CHAR(5) FOREIGN KEY REFERENCES [MsMedicineType](MedicineTypeID),
	MedicineName VARCHAR(255) NOT NULL,
	MedicinePrice INT NOT NULL,
	MedicineStock INT NOT NULL
)

CREATE TABLE [TransactionHeader] (
	TransactionID CHAR(5) PRIMARY KEY,
	DoctorID CHAR(5) FOREIGN KEY REFERENCES [MsDoctor](DoctorID),
	PatientID CHAR(5) FOREIGN KEY REFERENCES [MsPatient](PatientID),
	TransactionDate DATE NOT NULL
)

CREATE TABLE [TransactionDetail] (
	TransactionID CHAR(5) FOREIGN KEY REFERENCES [TransactionHeader](TransactionID),
	MedicineID CHAR(5) FOREIGN KEY REFERENCES [MsMedicine](MedicineID),
	Quantity INT NOT NULL
)

--2
INSERT INTO [MsPatient] VALUES
('R0001', 'Budi','Jalan Bahagia 11 No. 1','081498765671', '2000-10-13'),
('R0002', 'Lisa','Jalan Dua 5 No. 12','081567891234', '1999-06-01'),
('R0003', 'Roy', 'Jalan Belakang 2 No. 25','082309142225','2002-11-11')

INSERT INTO [MsDoctor] VALUES
('DC001', 'Ahmed','Jalan Depan 2 No. 6','081278549564', '1990-12-25'),
('DC002', 'Peter','Jalan Merdeka 1 No. 76','081324561678', '1975-01-03'),
('DC003', 'Jane', 'Jalan Samping 7 No. 9','087767548880','1997-09-13')

INSERT INTO [MsMedicineType] VALUES
('MDT01', 'Liquid'),
('MDT02', 'Tablet'),
('MDT03', 'Capsule')

INSERT INTO [MsMedicine] VALUES
('MD001', 'MDT02', 'Panadol', '8500', '25'),
('MD002', 'MDT01', 'OBH', '12500', '10'),
('MD003', 'MDT03', 'Obat Diabetes', '25000', '15')

--3
GO
CREATE VIEW [View1] AS
SELECT 
[Medicine ID] = MedicineID, 
[MedicineTypeID] = MedicineTypeID, 
[MedicineName]=MedicineName, 
[MedicinePrice] = MedicinePrice,
[MedicineStock] = MedicineStock
FROM MsMedicine

--4
BEGIN TRANSACTION
UPDATE MsMedicine
SET MedicineStock = 2
COMMIT

BEGIN TRANSACTION
UPDATE MsMedicine
SET MedicineStock = 2
SELECT * FROM MsMedicine WHERE MedicineStock = 2
ROLLBACK

SELECT * FROM MsMedicine

--5
SELECT
DoctorID, DoctorName, DoctorPhone
FROM MsDoctor