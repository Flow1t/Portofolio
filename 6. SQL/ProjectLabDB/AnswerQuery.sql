--1.Display SupplierName, PurchaseDate, Total Ingredient Purchased (obtained from the sum of the quantity) for every purchase date is before the 20th day of the month and the supplier’s email contains “yahoo” in their email.

SELECT
SupplierName, 
[PurchaseDate] = TransactionDate,
[Total Ingredient Purchased] = SUM(td.Quantity),
SupplierEmail
FROM Supplier sp
JOIN TransactionDetail td ON sp.SupplierID = td.SupplierID
JOIN Ingredient ig ON td.IngredientID = ig.IngredientID
WHERE DAY(TransactionDate) < 20 AND SupplierEmail = '%yahoo%'
GROUP BY SupplierName, TransactionDate, SupplierEmail

--2.  	Display StaffName, SalesDate (obtained from sales date in ‘dd mon yyyy’ format), and Total Sales (obtained from the total of sales transactions) for every staff salary is less than 5000000 and sales occurred on Wednesday or Saturday.
SELECT
	StaffName,
	SalesDate = CONVERT(VARCHAR, SalesDate, 106),
	[Total Sales] = st.SalesQuantity
FROM BaskinStaff bs JOIN SalesTransaction st
ON bs.StaffID = st.StaffID
WHERE StaffSalary < 5000000 AND
DATENAME(WEEKDAY, st.SalesDate) IN ('Wednesday', 'Friday')


--3.	Display StaffName, Average Purchase Quantity (obtained from average purchase quantity), Total Ingredient Supplied (obtain from the sum of purchase quantity), for every transaction handled by staff whose gender is female and total Ingredient Supplied more than 9.
SELECT
StaffName,
[Average Purchase Quantity] = ROUND(AVG(td.Quantity),1),
[Total Ingredient Supplied] = SUM(td.Quantity)
FROM BaskinStaff bs
JOIN TransactionDetail td ON bs.StaffID = td.StaffID
WHERE StaffGender = 'Female' AND Quantity > 9
GROUP BY StaffName

--4.  Display SupplierName, Total Purchase (obtained from the total of the purchase transaction), and Average Purchase Price (obtained from the average of ingredient’s purchase price and started with ‘Rp. ’) for every transaction occurred in month 8 and supplier name contain three words.
SELECT
	SupplierName,
	[Total Purchase] = td.Quantity,
	[Average Purchase] = 'Rp. ' + CAST(ig.IngredientPrice AS VARCHAR)
FROM Supplier sp JOIN TransactionDetail td 
ON sp.SupplierID = td.SupplierID JOIN Ingredient ig
ON ig.IngredientID = td.IngredientID
WHERE MONTH(td.TransactionDate) = '08' AND
LEN(sp.SupplierName) >= 3


--5.	Display SupplierName, SupplierPhone (obtained by replacing supplier phone first character into ‘+62’), PurchaseDate, StaffName, and Quantity (obtain by adding ‘ item’ at the end of total purchase quantity) for every transaction that quantity is greater than the average of all purchase quantity and the transaction occurred in September or December. (alias subquery)
SELECT 
	SupplierName,
	[SupplierPhone] = REPLACE(SupplierPhone, LEFT(SupplierPhone,1), '+62'),
	TransactionDate, StaffName,
	[Quantity] = CAST(Quantity AS VARCHAR) + ' item'
FROM Supplier sp
JOIN TransactionDetail td ON sp.SupplierID = td.SupplierID
JOIN BaskinStaff bs ON td.StaffID = bs.StaffID, (
	SELECT
		AVG(Quantity) AS Average
	FROM TransactionDetail
) as x
WHERE Quantity > x.Average AND (MONTH(TransactionDate)=9 OR MONTH(TransactionDate)=12)

--6.  Display Customer ID (obtained by replacing ‘CS’ with ‘Customer ’), Handle by (obtained by replacing ‘ST00’ into ‘Staff ’), Total Ice Cream Sales Price (obtained from the total of sales price times quantity and adding ‘Rp. ’ in front of Total Ice Cream Sales Price), IceCreamName, and Quantity for every transaction where the sales price is the lowest and quantity more than 3. (alias subquery)

SELECT
	[Customer ID] = REPLACE(cs.CustomerID, 'CS', 'Customer'),
	[Staff ID] = REPLACE(bs.StaffID, 'ST00', 'Staff'),
	[Total Ice Cream Sales Price] = CONCAT('Rp. ', SUM(IceCreamPrice*SalesQuantity)),
	[Ice Cream Name] = IceCreamName,
	[Quantity] = SalesQuantity
FROM Customer cs 
JOIN SalesTransaction st ON cs.CustomerID = st.CustomerID
JOIN IceCream ic ON st.IceCreamID = ic.IceCreamID
JOIN BaskinStaff bs ON st.StaffID = bs.StaffID, (
	SELECT 
		MIN(IceCreamPrice) AS minimum
	FROM IceCream
) as x
WHERE IceCreamPrice = x.minimum AND SalesQuantity > 3
GROUP BY cs.CustomerID, bs.StaffID, IceCreamName, SalesQuantity, IceCreamPrice

--7.  Display Last Name (obtained from staff’s last name), Total Sales Has been done (obtained from the total of the sales transaction), and StaffSalary for every transaction handled by male staff that has salary less than the average of all staff salary.(alias subquery)

select [Last Name] = SUBSTRING(bs.StaffName,CHARINDEX(' ', bs.staffName)+1, LEN(bs.staffName)),
		[total Sales] = (select sum(st.SalesQuantity) from SalesTransaction st where st.StaffID = bs.StaffID),
		[staffSalary] =  bs.StaffSalary
from baskinstaff bs
where bs.StaffGender = 'Male'
and bs.StaffSalary < (Select AVG(s.StaffSalary) from BaskinStaff s where s.StaffID = bs.StaffID)

--8.  Display Staff Initial (obtained from the first character of staff’s name and last character of staff’s name in uppercase format), CustomerID, Total Sales (obtained from the total of sales transaction), SalesDate for every transaction that quantity is the smallest and which is the customer id served by staff ends with an even number.(Alias subquery)

Select [initial] = UPPER(LEFT(bs.StaffName,1) + LEFT(SUBSTRING(bs.StaffName,CHARINDEX(' ', bs.staffName)+1, LEN(bs.staffName)),1)),
		[total sales] = COUNT(st.StaffID),
		[sales date] = st.SalesDate
from BaskinStaff bs
join SalesTransaction st on bs.StaffID = st.StaffID
join customer c on c.CustomerID = st.CustomerID
where st.SalesQuantity in (select MIN(SalesQuantity) from SalesTransaction )
group by bs.StaffName, st.SalesDate, st.SalesQuantity

--9.  Create a view named ‘ViewPurchaseTransaction’ to display StaffEmail, Purchase Date, Total Purchase Ingredient (obtained from the sum of quantity), and Total Purchase Transaction (obtained from the total of the purchase transaction) for every staff whose born over 2001 and total purchase Ingredient more than 10.(Alias subquery)
create view	ViewPurchaseTransaction as
select bs.StaffEmail,
		[Total Purchase Ingredient] = SUM(td.Quantity),
		[Total Purchase Transaction] = COUNT(td.TransactionID)
from BaskinStaff bs
join TransactionDetail td on td.StaffID = bs.StaffID
group by bs.StaffEmail

--10.  Create a view named ‘ViewSalesTransaction’ to display StaffName, Sales Date (obtained from sales date in ‘Mon dd, yyyy’ format), Total Sales Transaction (obtained from the total of sales transaction), Total Sales Quantity (obtained from the sum of quantity) for every transaction that Ice Cream’s sales price is greater than 45000 and total sales transaction is less than 5.
create view ViewSalesTransaction as
select bs.StaffName,
		st.SalesDate,
		[Total Sales Transaction] = COUNT(st.SalesID),
		[Total Sales Quantity] = SUM(st.SalesQuantity)
from SalesTransaction st
join BaskinStaff bs on st.StaffID = bs.StaffID
join IceCream i on i.IceCreamID = st.IceCreamID
where i.IceCreamPrice > 45000
group by bs.staffName, st.SalesDate
HAVING COUNT(st.SalesID) < 5 

