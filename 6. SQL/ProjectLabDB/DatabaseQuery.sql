CREATE DATABASE Baskin
GO
USE Baskin
GO 

CREATE TABLE [BaskinStaff](
	StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) NOT NULL,
	StaffDOB DATE CHECK (YEAR(StaffDOB) <= 2002),
	StaffGender VARCHAR(10) NOT NULL,
	StaffAddress VARCHAR(50) NOT NULL,
	StaffEmail VARCHAR(50) CHECK (StaffEmail LIKE '%@%'),
	StaffPhone VARCHAR(13) CHECK (LEN(StaffPhone) BETWEEN 12 AND 13),
	StaffSalary FLOAT NOT NULL
);

CREATE TABLE [Ingredient](
	IngredientID CHAR(5) PRIMARY KEY CHECK (IngredientID LIKE 'IG[0-9][0-9][0-9]'),
	IngredientName VARCHAR(50) NOT NULL,
	IngredientStock INT NOT NULL,
	IngredientPrice FLOAT NOT NULL
);

CREATE TABLE [Customer](
	CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CS[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerDOB DATE NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL,
	CustomerAddress VARCHAR(50) NOT NULL,
	CustomerEmail VARCHAR(50) CHECK (CustomerEmail LIKE '%@%'),
	CustomerPhone VARCHAR(13) CHECK (LEN(CustomerPhone) BETWEEN 12 AND 13)
);

CREATE TABLE [IceCream](
	IceCreamID CHAR(5) PRIMARY KEY CHECK (IceCreamID LIKE 'IC[0-9][0-9][0-9]'),
	IceCreamName VARCHAR(50) NOT NULL,
	IceCreamPrice FLOAT NOT NULL,
	IceCreamStock INT CHECK (IceCreamStock BETWEEN 0 AND 100)
);

CREATE TABLE [Supplier](
	SupplierID CHAR(5) PRIMARY KEY CHECK (SupplierID LIKE 'SP[0-9][0-9][0-9]'),
	SupplierName VARCHAR(50) NOT NULL,
	SupplierEmail VARCHAR (50) CHECK (SupplierEmail LIKE '%@%'),
	SupplierPhone VARCHAR(13) CHECK (LEN(SupplierPhone) BETWEEN 12 AND 13),
	SupplierAddress VARCHAR(50) NOT NULL
);

CREATE TABLE [TransactionDetail](
	TransactionID CHAR(5) PRIMARY KEY CHECK (TransactionID LIKE 'PO[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES BaskinStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SupplierID CHAR(5) FOREIGN KEY REFERENCES Supplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	IngredientID CHAR(5) FOREIGN KEY REFERENCES Ingredient(IngredientID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	TransactionDate DATE NOT NULL,
	Quantity INT NOT NULL
);

CREATE TABLE [SalesTransaction](
	SalesID CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SL[0-9][0-9][0-9]'),
	StaffID CHAR (5) FOREIGN KEY REFERENCES BaskinStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR (5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	IceCreamID Char(5) FOREIGN KEY REFERENCES IceCream(IceCreamID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesDate DATE NOT NULL,
	SalesQuantity INT NOT NULL
);