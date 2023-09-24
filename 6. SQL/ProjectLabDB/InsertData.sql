USE Baskin
GO

INSERT INTO BaskinStaff VALUES 
('ST001', 'Bonnie Kelly','1999-08-27', 'Male', '1271 Melrose Street', 'lexandreas@wpdork.comm', '509292956324',20000000),
('ST002', 'Heidi Russell','1997-03-07', 'Male', '4698 Hillside Drive', 'talhah@osmye.com', '332930391344',1230945),
('ST003', 'Misty Hill','1992-02-17', 'Male', '4917 Evergreen Lane', 'mamita2214@tesmail.site', '312335391947',12342156),
('ST004', 'Dianne Carlson','1998-03-16', 'Female', '4485 Hemlock Lane', 'gonzo333@highdosage.org', '952654520476',7645342),
('ST005', 'Antonio Bradley','2000-03-08', 'Male', '402 Grey Fox Farm Road', 'justin16bieber16@fnaul.com', '281137730594',2345138),
('ST006', 'Joe Cox','2001-08-08', 'Female', '4214 Hardman Road', 'vlasowcol@jaxwin.com', '804281145546',5600000),
('ST007', 'Frederick Armstrong','1998-02-27', 'male', '1428 Vine Street', 'couple85602@plexvenet.com', '824754900529',3432000),
('ST008', 'Ruth Moody','1985-04-23', 'Male', '1346 Linden Avenue', 'chairatone@smulevip.com', '402758630938',3420000),
('ST009', 'Lynette Curry','1993-04-27', 'Female', '749 Emily Renzell', 'redcass@pastipass.com', '831162324947',1200000),
('ST010', 'Andre Henderson','1985-03-14', 'Male', '29 Coplin Avenue', 'koneva1973@rmune.com', '630251214349',6500000),
('ST011', 'Joann Long','1999-03-05', 'Male', '558 Woodside Circle', 'tech1234@zukk.com', '853077406184',3400000),
('ST012', 'Leonard Evans','1999-09-23', 'Male', '3066 Terra Street', 'killkf@zukk.com', '361032511173',2100000),
('ST013', 'Duane Rhodes','1999-10-12', 'Female', '2148 Carolyns Circle', 'kerry6505@cashbackr.com', '214474347258',2100000);

INSERT INTO Customer VALUES 
('CS001', 'Gina Metcalfe','2000-05-03', 'Female', '915 Homenick Estate', 'kerry6505@cashbackr.com', '904391985057'),
('CS002', 'Miyah Lowry','1984-02-08', 'Female', '21 Shepherd Way', 'thimoh@rmune.com', '236772664892'),
('CS003', 'Sumayyah Walker','1993-05-10', 'Female', '564 Brick Kiln Town', 'abeloo@mailcuk.com', '432641658845'),
('CS004', 'Kadeem Mcgee','1988-05-13', 'Male', '231 Gibson Park', 'gggg13gg@gmailni.com', '426063290598 '),
('CS005', 'Maude Ortega','1997-07-07', 'Female', '290 Hurst Brae', 'vineeshcheenikkal@mail.com', '453068032114'),
('CS006', 'Olivia Redman','1992-02-02', 'Female', '213 Harwood Ridings', 'domenteanion@stinkypoopoo.com', '301085455713 '),
('CS007', 'Garry Baird','1991-06-23', 'Male', '2132 Hartland Coppice', 'jennif@ucyeh.com', '550860502684 '),
('CS008', 'Niall Tran','1995-10-11', 'Male', '312 Crompton Paddock', 'lubrani@pianoxltd.com', '886552235434'),
('CS009', 'Yunus Jensen','1992-03-22', 'Male', '981 Kenilworth Woodlands', 'wqdwbv3e@sepican.com', '744446217902'),
('CS010', 'Taran Chen','1994-06-18', 'Male', '21 St Marys Lane', 'tyfar@plexvenet.com', '730090686588 '),
('CS011', 'Kajal Swan','1993-02-18', 'Male', '71 Harvey Circus', 'koi00155@packiu.com', '533518810393'),
('CS012', 'Danniella Dawe','1993-11-21', 'Male', '21 Twyford Grovet', 'gharibtirdad@falixiao.com', '863697492872'),
('CS013', 'Gabrielius Logan','1989-04-12', 'Male', '21 Bethell Mead', 'dabom@plexvenet.com', '230828646999 ');

INSERT INTO Ingredient VALUES
('IG001', 'Sugar', 500, 14000),
('IG002', 'Milk', 600, 30000),
('IG003', 'Egg', 350, 3000),
('IG004', 'Vanili', 100, 10000),
('IG005', 'Maizena Powder', 200, 8000),
('IG006', 'Chocolate Powder', 150, 18000),
('IG007', 'Espresso', 260, 20000),
('IG008', 'Whipped Cream', 80, 25000),
('IG009', 'Salt', 350, 3000),
('IG010', 'Mango', 500, 30000),
('IG011', 'Matcha', 300, 5000),
('IG012', 'Oreo', 340, 30000),
('IG013', 'Coconut Powder', 150, 5000);

INSERT INTO Supplier VALUES
('SP001', 'Burhan', 'burhan123@gmail.com', '081385430981', 'Jl.Pancing 82A'),
('SP002', 'Annisa', 'tryme13@gmail.com', '081363018719', 'Jl.Kemabang 12B'),
('SP003', 'Farhan', 'likeme091@gmail.com', '081293402981', 'Jl.Perintisan 09B'),
('SP004', 'Budi', 'budianto@gmail.com', '081249187201', 'Jl.Perjuangan 87C'),
('SP005', 'Mutia', 'mutiasari87@gmail.com', '081248201938', 'Jl.Tahu isi 34D'),
('SP006', 'Franskentein', 'stepby43@gmail.com', '081383044592', 'Jl.Kembang 1A'),
('SP007', 'Goliar', 'Goliarna01@gmail.com', '081330298145', 'Jl.Tamora 3A'),
('SP008', 'Asep', 'monarch093@gmail.com', '081301400291', 'Jl.Panca Indah 09A'),
('SP009', 'Nirguja', 'Nirwana29@gmail.com', '081377778787', 'Jl.Ancol 3A'),
('SP010', 'Anton', 'antonsen@gmail.com', '081286761893', 'Jl.Tangga Merah 04C'),
('SP011', 'Septi', 'burhanuddin03@gmail.com', '081390239032', 'Jl.Kembang 2A'),
('SP012', 'Uus', 'ustimati37@gmail.com', '081201908023', 'Jl.Pancing 1A'),
('SP013', 'Nobita', 'doraemon@gmail.com', '081386761782', 'Jl.Tamora 3B');

INSERT INTO IceCream VALUES
('IC001', 'Chocolate Ice Cream', 10000, 50),
('IC002', 'Mango Ice Cream', 15000, 30),
('IC003', 'Vanilla Ice Cream', 7000, 85),
('IC004', 'Matcha Ice Cream', 12000, 70),
('IC005', 'Oreo Ice Cream', 20000, 45),
('IC006', 'Coconut Ice Cream', 18000, 20),
('IC007', 'Espresso Ice Cream', 15000, 100),
('IC008', 'Matcha Oreo Ice Cream', 22000, 10),
('IC009', 'Oreo Coconut Ice Cream', 24000, 65),
('IC010', 'Chocolate Vanilla Ice Cream', 15000, 100),
('IC011', 'Espresso Mango', 20000, 75),
('IC012', 'Original Ice Cream', 5000, 65),
('IC013', 'Chocolate Matcha Ice Cream', 120000, 50);

INSERT INTO TransactionDetail VALUES
('PO001','ST001','SP010','IG001','2022-01-10',500),
('PO002','ST001','SP009','IG002','2022-01-20',500),
('PO003','ST002','SP012','IG003','2022-02-10',500),
('PO004','ST006','SP006','IG004','2022-03-20',500),
('PO005','ST007','SP003','IG005','2022-04-10',500),
('PO006','ST004','SP011','IG006','2022-06-20',500),
('PO007','ST004','SP011','IG007','2022-07-20',500),
('PO008','ST008','SP010','IG008','2022-10-20',500),
('PO009','ST010','SP008','IG009','2022-11-10',500),
('PO010','ST009','SP006','IG010','2022-04-10',500),
('PO011','ST002','SP012','IG011','2022-05-10',500),
('PO012','ST003','SP013','IG012','2022-07-20',500),
('PO013','ST013','SP003','IG013','2022-07-20',500),
('PO014','ST012','SP002','IG013','2022-02-10',500),
('PO015','ST006','SP009','IG012','2022-03-10',500),
('PO016','ST008','SP010','IG011','2022-09-20',500),
('PO017','ST008','SP008','IG010','2022-11-20',500),
('PO018','ST010','SP004','IG009','2022-12-20',500),
('PO019','ST011','SP007','IG008','2022-09-10',500),
('PO020','ST011','SP011','IG007','2022-07-10',500),
('PO021','ST003','SP002','IG006','2022-08-20',500),
('PO022','ST006','SP001','IG005','2022-10-30',500),
('PO023','ST012','SP001','IG004','2022-06-30',500),
('PO024','ST009','SP003','IG003','2022-02-10',500),
('PO025','ST010','SP001','IG001','2022-03-30',500);

INSERT INTO SalesTransaction VALUES
('SL001', 'ST001', 'CS001', 'IC002', '2022-06-15', 2),
('SL002', 'ST001', 'CS003', 'IC003', '2022-06-10', 1),
('SL003', 'ST001', 'CS006', 'IC003', '2022-06-30', 3),
('SL004', 'ST001', 'CS004', 'IC006', '2022-01-01', 2),
('SL005', 'ST001', 'CS004', 'IC001', '2022-01-11', 1),
('SL006', 'ST001', 'CS008', 'IC001', '2022-02-22', 5),
('SL007', 'ST001', 'CS011', 'IC007', '2022-06-27', 5),
('SL008', 'ST001', 'CS012', 'IC006', '2022-08-25', 7),
('SL009', 'ST001', 'CS009', 'IC009', '2022-09-05', 3),
('SL010', 'ST001', 'CS003', 'IC009', '2022-12-12', 4),
('SL011', 'ST001', 'CS005', 'IC011', '2022-11-11', 10),
('SL012', 'ST001', 'CS007', 'IC013', '2022-06-10', 9),
('SL013', 'ST001', 'CS009', 'IC013', '2022-04-08', 3),
('SL014', 'ST001', 'CS009', 'IC013', '2022-05-27', 5),
('SL015', 'ST001', 'CS002', 'IC010', '2022-10-12', 7);

