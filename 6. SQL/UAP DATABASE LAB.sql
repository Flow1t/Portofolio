--Devin Augustin - 2440094352

USE PhunShop

--1.Display StaffName, StaffSalary, and StaffPosition for every Staff whose gender is 'Male'. (LIKE)

SELECT StaffName, StaffSalary, StaffPosition
FROM MsStaff
WHERE StaffGender = 'Male'

--2.Display CustomerName and TransactionDate for every transaction made in ‘July’.(DATENAME, MONTH, JOIN)

SELECT CustomerName, TransactionDate
FROM MsCustomer mc
JOIN TrHeaderTransaction tht ON mc.CustomerID = tht.CustomerID
WHERE MONTH(TransactionDate) = 7

--3 Display CustomerName, CustomerEmail, and TotalTransaction (obtained from the count of all transaction) for every customer whose gender is 'Female' and has a TotalTransaction that is higher than 1. Then, order the data by CustomerName in an ascending order.(COUNT, LIKE, ORDER BY, JOIN)

SELECT CustomerName, CustomerEmail,
COUNT(tht.TransactionID) AS TotalTransaction
FROM MsCustomer mc
JOIN TrHeaderTransaction tht ON mc.CustomerID = tht.CustomerID
WHERE CustomerGender LIKE 'Female' 
GROUP BY CustomerName, CustomerEmail
HAVING COUNT(tht.TransactionID) > 1
ORDER BY CustomerName ASC

--4.	Display CustomerID, CustomerName, CustomerGender, and TotalPhoneBought (obtained from the total of phones bought) where customer has a 'Female' gender and the count of items in each detail transaction is bigger than 2. Then, combine with CustomerID, CustomerName, CustomerGender, and TotalPhoneBought (obtained from the total of phones bought) where customer has a ‘Male’ gender and the count of items in each detail transaction is smaller than 8. (SUM, LIKE, COUNT, UNION)

SELECT mc.CustomerID, CustomerName, CustomerGender,
SUM(tdt.Quantity) AS TotalPhoneBought
FROM MsCustomer mc
JOIN TrHeaderTransaction tht ON mc.CustomerID = tht.CustomerID
JOIN TrDetailTransaction tdt ON tht.TransactionID = tdt.TransactionID
JOIN MsPhone mp ON tdt.PhoneID = mp.PhoneID
WHERE CustomerGender LIKE 'Female'
GROUP BY mc.CustomerID, CustomerName, CustomerGender
HAVING COUNT(tdt.Quantity) > 2
UNION
SELECT mc.CustomerID, CustomerName, CustomerGender,
SUM(tdt.Quantity) AS TotalPhoneBought
FROM MsCustomer mc
JOIN TrHeaderTransaction tht ON mc.CustomerID = tht.CustomerID
JOIN TrDetailTransaction tdt ON tht.TransactionID = tdt.TransactionID
JOIN MsPhone mp ON tdt.PhoneID = mp.PhoneID
WHERE CustomerGender LIKE 'Male'
GROUP BY mc.CustomerID, CustomerName, CustomerGender
HAVING COUNT(tdt.Quantity) < 8

--5.Display TransactionID, PhoneID, and Quantity where (‘SimSong’ or ‘Iphony’) PhoneBrand is sold, and quantity sold is higher than 3.(IN, LIKE)

SELECT TransactionID, mp.PhoneID, Quantity
FROM MsPhoneBrand mpb
JOIN MsPhone mp ON mpb.BrandID = mp.BrandID
JOIN TrDetailTransaction tdt ON mp.PhoneID = tdt.PhoneID
WHERE mpb.BrandID IN (
	SELECT BrandID
	FROM MsPhoneBrand
	WHERE BrandName LIKE 'Simsong' OR BrandName LIKE 'Iphony')AND Quantity > 3

--6.Display CustomerName (Obtained from the first word in CustomerName), CustomerAddress, and TotalTransaction (obtained from the total number of transactions) where customer’s address ends with ‘Pass’ and TotalTransaction is higher than 1.(LEFT, CHARINDEX, ALIAS SUBQUERY, COUNT, LIKE)

SELECT 
[CustomerName] = LEFT(CustomerName,CHARINDEX(' ', CustomerName)), 
CustomerAddress,
COUNT(tht.TransactionID) AS TotalTransaction
FROM MsCustomer mc
JOIN TrHeaderTransaction tht ON mc.CustomerID = tht.CustomerID
WHERE CustomerAddress  LIKE '%Pass' 
GROUP BY CustomerName, CustomerAddress
HAVING COUNT(tht.TransactionID)>1

--7.Create a view named ‘ViewStaffData’ to display StaffName, StaffGender (obtained by taking the first character from StaffGender), and StaffSalary (obtained by adding ‘Rp. ‘ in front of StaffSalary).(CREATE VIEW, LEFT, CAST)

GO
CREATE VIEW ViewStaffData AS
SELECT StaffName,
[StaffGender] = LEFT(StaffGender, 1),
[StaffSalary] = 'Rp. ' + CAST(StaffSalary AS VARCHAR)
FROM MsStaff

--8.	Create a view named ‘ViewTotalSales’ to display StaffName, StaffSalary(obtained by adding ‘Rp. ‘ infront of StaffSalary), and TotalPhoneSold (obtained from the total number of phone sold) where transactions are made in 2021 and TotalPhoneSold is higher than 10.(CREATE VIEW, CAST, SUM, YEAR)

GO
CREATE VIEW ViewTotalSales AS
SELECT 
StaffName,
[StaffSalary] = 'Rp. ' + CAST(StaffSalary AS VARCHAR),
SUM(TransactionID) AS TotalPhoneSold
FROM MsStaff ms
JOIN TrHeaderTransaction tht ON ms.StaffID = tht.StaffID
WHERE YEAR(TransactionDate) =  2021 
GROUP BY StaffName, StaffSalary
HAVING SUM(TransactionID) >10

--9.	Add a column named PhoneDescription on MsPhone table with varchar (180) datatype and add a constraint named DescriptionLength to check the length of PhoneDescription must be higher than or equals to 50 characters.(ALTER TABLE, ADD, ADD CONSTRAINT, LEN)

ALTER TABLE MsPhone
ADD PhoneDescription VARCHAR(180)
ALTER TABLE MsPhone
ADD CONSTRAINT DescriptionLength CHECK (LEN(PhoneDescription)>=50)

SELECT * FROM MsPhone

--10.	Add StaffSalary by 1000000 for every staff who has done a transaction in 2021 and has served a customer named ‘Kimmie Foyster’.(UPDATE, YEAR, LIKE)

UPDATE MsStaff
SET StaffSalary = StaffSalary+1000000
WHERE StaffName = (
	SELECT StaffName 
	FROM MsStaff ms
	JOIN TrHeaderTransaction tht ON ms.StaffID = tht.StaffID
	JOIN MsCustomer mc ON tht.CustomerID = mc.CustomerID
	WHERE YEAR(TransactionDate) = 2021 AND CustomerName LIKE 'Kimmie Foyster'
)

UPDATE MsStaff
SET StaffSalary = StaffSalary+1000000
FROM MsStaff ms
JOIN TrHeaderTransaction tht ON ms.StaffID = tht.StaffID
JOIN MsCustomer mc ON tht.CustomerID = mc.CustomerID
WHERE YEAR(TransactionDate) = 2021 AND CustomerName LIKE 'Kimmie Foyster'

SELECT * FROM MsStaff