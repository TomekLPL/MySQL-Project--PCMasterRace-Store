-- 1. I create a database called "PCMasterRace". It is a database of a fictitious computer store.

drop database if exists pcmasterrace;
create database pcmasterrace;
use pcmasterrace;

create table ProductCategories (
    CategoryID int auto_increment primary key,
    CategoryName varchar(100) not null,
    CategoryDescription text
);

create table Products (
    ProductID int auto_increment primary key,
    ProductName varchar(100) not null,
    ProductDescription text,
    Price decimal(10,2) not null,
    CategoryID int,
    StockQuantity int default 0,
    foreign key (CategoryID) references ProductCategories(CategoryID)
);

create table Customers (
    CustomerID int auto_increment primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Email varchar(100),
    Phone varchar(20),
    Address varchar(100),
    City varchar(50),
    PostalCode varchar(20),
    Country varchar(50)
);

create table Employees (
    EmployeeID int auto_increment primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Email varchar(100),
    Phone varchar(20),
    Position varchar(50),
    SupervisorsID int
);

create table Orders (
    OrderID int auto_increment primary key,
    CustomerID int,
    EmployeeID int,
    OrderDate DATE not null,
    ShipDate DATE,
    ShipAddress varchar(100),
    ShipCity varchar(50),
    ShipPostalCode varchar(20),
    ShipCountry varchar(50),
    foreign key (CustomerID) references Customers(CustomerID),
    foreign key (EmployeeID) references Employees(EmployeeID)
);

create table OrderInfo (
    OrderID int,
    ProductID int,
    Quantity int default 1,
    UnitPrice decimal(10,2) not null,
    Discount decimal(5,2) default 0,
    primary key (OrderID, ProductID),
    foreign key (OrderID) references Orders(OrderID),
    foreign key (ProductID) references Products(ProductID)
);

insert into  ProductCategories (CategoryName, CategoryDescription)
values
    ('Desktop Computers', 'Various models of desktop computers, including gaming PCs and office desktops.'),
    ('Laptops', 'A range of laptops from ultrabooks to gaming laptops.'),
    ('Monitors', 'Different sizes and types of monitors, including LED, LCD, and gaming monitors.'),
    ('keyboards', 'Mechanical, membrane, and wireless keyboards for various needs.'),
    ('Mice', 'Optical and laser mice, including gaming and ergonomic models.'),
    ('Storage Devices', 'internal and external storage solutions, including HDDs, SSDs, and USB drives.'),
    ('Networking Equipment', 'Routers, switches, modems, and other networking hardware.'),
    ('Software', 'Operating systems, productivity software, and antivirus programs.'),
    ('Printers & Scanners', 'Inkjet, laser printers, and scanners for home and office use.'),
    ('Computer Components', 'Parts like CPUs, GPUs, RAM, motherboards, and power supplies for building or upgrading PCs.');

insert into  Customers (FirstName, LastName, Email, Phone, Address, City, PostalCode, Country)
values
    ('John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm Street', 'Anytown', '12345', 'USA'),
    ('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak Avenue', 'Othertown', '67890', 'USA'),
    ('Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', '789 Pine Road', 'Sometown', '13579', 'USA'),
    ('Bob', 'Williams', 'bob.williams@example.com', '555-4321', '321 Maple Lane', 'Yourtown', '24680', 'USA'),
    ('Carol', 'Brown', 'carol.brown@example.com', '555-2468', '654 Cedar Blvd', 'Mytown', '11223', 'USA'),
    ('Dave', 'Davis', 'dave.davis@example.com', '555-1357', '987 Birch Court', 'Hisown', '44556', 'USA'),
    ('Eve', 'Miller', 'eve.miller@example.com', '555-9753', '159 Spruce Street', 'Hertown', '77889', 'USA'),
    ('Frank', 'Wilson', 'frank.wilson@example.com', '555-8642', '753 Willow Drive', 'Thistown', '99001', 'USA'),
    ('Grace', 'Taylor', 'grace.taylor@example.com', '555-3579', '852 Aspen Loop', 'Thattown', '22334', 'USA'),
    ('Henry', 'Anderson', 'henry.anderson@example.com', '555-4862', '951 Walnut Way', 'Anycity', '55667', 'USA');
   
insert into  Employees (FirstName, LastName, Email, Phone, Position, SupervisorsID )
values
    ('Emily', 'Clark', 'emily.clark@example.com', '555-1111', 'Sales Manager', 5),
    ('Michael', 'Hall', 'michael.hall@example.com', '555-2222', 'Sales Associate', 5),
    ('Sarah', 'Lee', 'sarah.lee@example.com', '555-3333', 'Customer Service Rep', 1),
    ('James', 'Young', 'james.young@example.com', '555-4444', 'Technical Support', 5),
    ('Linda', 'King', 'linda.king@example.com', '555-5555', 'Store Manager', null);
    
insert into  Products (ProductName, ProductDescription, Price, CategoryID, StockQuantity)
values
    ('MegaGamer Desktop 3000', 'So powerful, it might just become self-aware!', 1999.99, 1, 10),
    ('UltraBook Pro X', 'Thinner than your patience during Monday meetings.', 1499.99, 2, 15),
    ('Infinity Display 27"', 'Pixels so real, you might try to touch them.', 299.99, 3, 20),
    ('Clicky Mechanical keyboard', 'The loudest way to say "I am typing an email."', 79.99, 4, 25),
    ('Silent Mouse', 'For those who prefer to sneak up on their spreadsheets.', 49.99, 5, 30),
    ('Quantum SSD 1TB', 'Stores data you haven\'t even created yet.', 199.99, 6, 40),
    ('SuperFast Router 9000', 'Downloads the internet before you even ask.', 129.99, 7, 35),
    ('Antivirus Plus', 'Protects against viruses, malware, and your bad browsing habits.', 59.99, 8, 50),
    ('LaserJet Printer XL', 'Because paper jams are a thing of the past... or are they?', 249.99, 9, 12),
    ('Ultimate Gaming GPU', 'Graphics so good, you’ll forget reality exists.', 699.99, 10, 5),
    ('Caffeine-Powered Laptop', 'Runs faster the more coffee you spill on it.', 1299.99, 2, 8),
    ('Hologram Monitor 50"', 'Images so real, you might walk into them.', 4999.99, 3, 2),
    ('Invisible keyboard', 'Good luck typing. It’s all about muscle memory!', 999.99, 4, 1),
    ('Time-Travel Mouse', 'Click to go back to before you made that typo.', 299.99, 5, 3),
    ('Infinite Storage HDD', 'You\'ll run out of things to store before it fills up.', 399.99, 6, 10),
    ('Teleportation Router', 'Connects you to networks in alternate dimensions.', 9999.99, 7, 1),
    ('Mind-Reading Software', 'No need to type, it knows what you want... or does it?', 199.99, 8, 50),
    ('3D Printer - Food Edition', 'Prints your lunch while you work.', 1999.99, 9, 4),
    ('CPU Overclocker Extreme', 'Pushes your processor beyond its limits... and sanity.', 149.99, 10, 7),
    ('Eco-Friendly Desktop', 'Powered by your hamster running in a wheel.', 499.99, 1, 9),
    ('Mouse Pad with GPS', 'Never lose your mouse pad again!', 19.99, 5, 50),
    ('Ergonomic keyboard', 'Comfortable typing even during those never-ending emails.', 69.99, 4, 20),
    ('Gaming Laptop - Dragon Slayer', 'For when you need to slay dragons and spreadsheets.', 1999.99, 2, 5),
    ('4K Ultra HD Monitor', 'So clear, you can see your future.', 399.99, 3, 15),
    ('Wireless Gaming Mouse', 'Cuts the cord so you can cut the competition.', 89.99, 5, 30),
    ('500GB External HDD', 'Portable storage for your massive collection of cat videos.', 59.99, 6, 40),
    ('Wi-Fi Extender', 'Because dead zones are so last decade.', 49.99, 7, 35),
    ('Office Suite Pro', 'Making spreadsheets exciting since never.', 149.99, 8, 100),
    ('All-in-One Printer', 'Prints, scans, faxes, and makes coffee (not really).', 199.99, 9, 12),
    ('High-Speed RAM 16GB', 'Because speed limits don’t apply to memory.', 79.99, 10, 25),
    ('Gaming Desktop - Beast Mode', 'Unleash the beast on your games.', 2499.99, 1, 7),
    ('Slim Laptop Sleeve', 'Protects your laptop from scratches and judgment.', 29.99, 2, 50),
    ('Curved Monitor 34"', 'Surround yourself with spreadsheets.', 599.99, 3, 10),
    ('RGB Mechanical keyboard', 'Type faster with more colors!', 129.99, 4, 20),
    ('Vertical Ergonomic Mouse', 'For a handshake-like grip with your mouse.', 49.99, 5, 30),
    ('2TB SSD', 'Because who has time to wait for files to load?', 299.99, 6, 40),
    ('Gigabit Switch', 'Switching so fast, you might get dizzy.', 99.99, 7, 15),
    ('Photo Editing Software', 'Making bad photos look good since last year.', 89.99, 8, 60),
    ('3D Printer', 'Prints objects you never knew you needed.', 999.99, 9, 5),
    ('Motherboard Xtreme', 'The mother of all boards.', 199.99, 10, 15),
    ('All-in-One Desktop', 'Because towers are so 2000.', 899.99, 1, 10),
    ('Convertible Laptop', 'Flips, folds, and probably does yoga.', 1099.99, 2, 8),
    ('Portable Monitor', 'Take your second screen on the go.', 199.99, 3, 20),
    ('Bluetooth keyboard', 'For when wires are too mainstream.', 49.99, 4, 25),
    ('Trackball Mouse', 'Roll your way to productivity.', 59.99, 5, 20),
    ('Cloud Storage Subscription', 'Store your files in someone else’s computer.', 99.99, 6, 100),
    ('Mesh Wi-Fi System', 'Because one router is never enough.', 299.99, 7, 15),
    ('Video Editing Software', 'Cutting videos and deadlines in half.', 199.99, 8, 40),
    ('Label Printer', 'Organize everything, even your procrastination.', 149.99, 9, 10),
    ('Power Supply 750W', 'Juice up your PC and maybe your coffee.', 89.99, 10, 25),
    ('Budget Desktop PC', 'Affordable performance for casual users.', 499.99, 1, 20),
    ('Gaming Laptop - Night Fury', 'Dominate games even in your sleep.', 1799.99, 2, 5),
    ('Gaming Monitor 240Hz', 'Refresh rates faster than your coffee breaks.', 499.99, 3, 12),
    ('Wireless Ergonomic keyboard', 'Comfort meets freedom.', 99.99, 4, 18),
    ('Gaming Mouse with 20 Buttons', 'More buttons than you’ll ever need.', 79.99, 5, 22),
    ('Portable SSD 512GB', 'Speed and portability in a tiny package.', 129.99, 6, 30),
    ('USB Wi-Fi Adapter', 'Instant Wi-Fi for your antique desktop.', 29.99, 7, 40),
    ('Antivirus Premium', 'Because viruses are bad, m’kay?', 49.99, 8, 70),
    ('Photo Scanner', 'Digitize your memories before they fade.', 199.99, 9, 8),
    ('Processor i9 Extreme', 'Processing power that overpowers.', 999.99, 10, 5),
    ('Home Office Desktop', 'For when your commute is from the bed to the desk.', 699.99, 1, 12),
    ('Ultralight Laptop', 'So light, you might forget you’re carrying it.', 1299.99, 2, 10),
    ('Dual Monitor Stand', 'Hold two monitors like a boss.', 99.99, 3, 15),
    ('Foldable keyboard', 'For typing on the go, literally.', 39.99, 4, 25),
    ('Laser Mouse', 'Precision pointing with laser technology.', 59.99, 5, 28),
    ('NAS Storage Device', 'Your own personal cloud at home.', 499.99, 6, 10),
    ('Fiber Optic Modem', 'Because speed is everything.', 199.99, 7, 12),
    ('Office Productivity Suite', 'Get more done, or at least feel like it.', 199.99, 8, 80),
    ('High-Speed Document Scanner', 'Scan documents faster than you can read them.', 299.99, 9, 6),
    ('Graphics Card RTX 3080', 'Unleash visual brilliance.', 699.99, 10, 4),
    ('Mini Desktop PC', 'Small size, big performance.', 599.99, 1, 15),
    ('Laptop Cooling Pad', 'Keeps your laptop and your lap cool.', 29.99, 2, 50),
    ('Touchscreen Monitor', 'Because sometimes you just want to poke the screen.', 349.99, 3, 14),
    ('Projection keyboard', 'Type on any surface, impress your friends.', 149.99, 4, 5),
    ('Gaming Mouse Pad XXL', 'Covers your desk and your mistakes.', 39.99, 5, 40),
    ('8TB External HDD', 'Store all the things.', 199.99, 6, 20),
    ('Dual-Band Router', 'Twice the bands, twice the fun.', 79.99, 7, 25),
    ('Language Learning Software', 'Learn a new language while avoiding work.', 99.99, 8, 60),
    ('3D Scanner', 'Bring real-world objects into the digital realm.', 899.99, 9, 3),
    ('Liquid Cooling System', 'Keep your PC cool under pressure.', 199.99, 10, 12),
    ('High-End Desktop PC', 'For the serious professional or gamer.', 1999.99, 1, 8),
    ('Student Laptop', 'Affordable and reliable for studies.', 399.99, 2, 20),
    ('Gaming Monitor 27"', 'Experience games like never before.', 399.99, 3, 15),
    ('Wireless Number Pad', 'Add numbers wirelessly.', 29.99, 4, 30),
    ('Silent Click Mouse', 'For stealth browsing.', 39.99, 5, 25),
    ('Backup Software', 'Because you never know when disaster strikes.', 49.99, 8, 70),
    ('Thermal Printer', 'Print receipts and labels with heat.', 129.99, 9, 8),
    ('CPU Overclocking Kit', 'Push your processor to the edge.', 59.99, 10, 18),
    ('VR-Ready Desktop', 'Step into virtual reality.', 1499.99, 1, 6),
    ('Convertible tablet Laptop', 'Flexibility for work and play.', 799.99, 2, 12),
    ('Graphic Design Monitor', 'Accurate colors for creative work.', 599.99, 3, 10),
    ('Solar keyboard', 'Powered by light, even your desk lamp.', 79.99, 4, 20),
    ('Ergonomic Vertical Mouse', 'Comfortable for long hours.', 49.99, 5, 25),
    ('1TB MicroSD Card', 'Tiny size, massive storage.', 249.99, 6, 50),
    ('Enterprise Router', 'For when your home network feels like an enterprise.', 399.99, 7, 5),
    ('Accounting Software', 'Because taxes are inevitable.', 149.99, 8, 40),
    ('Wireless All-in-One Printer', 'Print, scan, copy without wires.', 229.99, 9, 10),
    ('RGB RAM 32GB', 'Memory that glows.', 199.99, 10, 15),
    ('E-Sports Desktop', 'Compete at the highest level.', 2499.99, 1, 4),
    ('Professional Laptop', 'Powerhouse performance for professionals.', 1999.99, 2, 6);
 
insert into  Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipDate, ShipAddress, ShipCity, ShipPostalCode, ShipCountry)
values
    (1, 6, 2, '2024-10-01', '2024-10-03', '987 Birch Court', 'Hisown', '44556', 'USA'),
    (2, 3, 5, '2024-10-02', '2024-10-04', '789 Pine Road', 'Sometown', '13579', 'USA'),
    (3, 8, 1, '2024-10-03', '2024-10-05', '753 Willow Drive', 'Thistown', '99001', 'USA'),
    (4, 1, 4, '2024-10-04', '2024-10-06', '123 Elm Street', 'Anytown', '12345', 'USA'),
    (5, 5, 3, '2024-10-05', '2024-10-07', '654 Cedar Blvd', 'Mytown', '11223', 'USA'),
    (6, 9, 2, '2024-10-06', '2024-10-08', '852 Aspen Loop', 'Thattown', '22334', 'USA'),
    (7, 2, 5, '2024-10-07', '2024-10-09', '456 Oak Avenue', 'Othertown', '67890', 'USA'),
    (8, 7, 1, '2024-10-08', '2024-10-10', '159 Spruce Street', 'Hertown', '77889', 'USA'),
    (9, 4, 3, '2024-10-09', '2024-10-11', '321 Maple Lane', 'Yourtown', '24680', 'USA'),
    (10, 10, 4, '2024-10-10', '2024-10-12', '951 Walnut Way', 'Anycity', '55667', 'USA'),
    (11, 6, 1, '2024-10-11', '2024-10-13', '987 Birch Court', 'Hisown', '44556', 'USA'),
    (12, 3, 2, '2024-10-12', '2024-10-14', '789 Pine Road', 'Sometown', '13579', 'USA'),
    (13, 8, 5, '2024-10-13', '2024-10-15', '753 Willow Drive', 'Thistown', '99001', 'USA'),
    (14, 1, 3, '2024-10-14', '2024-10-16', '123 Elm Street', 'Anytown', '12345', 'USA'),
    (15, 5, 4, '2024-10-15', '2024-10-17', '654 Cedar Blvd', 'Mytown', '11223', 'USA'),
    (16, 9, 2, '2024-10-16', '2024-10-18', '852 Aspen Loop', 'Thattown', '22334', 'USA'),
    (17, 2, 1, '2024-10-17', '2024-10-19', '456 Oak Avenue', 'Othertown', '67890', 'USA'),
    (18, 7, 5, '2024-10-18', '2024-10-20', '159 Spruce Street', 'Hertown', '77889', 'USA'),
    (19, 4, 3, '2024-10-19', '2024-10-21', '321 Maple Lane', 'Yourtown', '24680', 'USA'),
    (20, 10, 4, '2024-10-20', '2024-10-22', '951 Walnut Way', 'Anycity', '55667', 'USA'),
    (21, 7, 2, '2024-10-21', null, '159 Spruce Street', 'Hertown', '77889', 'USA'),
    (22, 5, 4, '2024-10-22', null, '654 Cedar Blvd', 'Mytown', '11223', 'USA'),
    (23, 9, 1, '2024-10-23', null, '852 Aspen Loop', 'Thattown', '22334', 'USA');
    
INSERT INTO OrderInfo (OrderID, ProductID, Quantity, UnitPrice, Discount)
VALUES
    (1, 1, 1, 1999.99, 0),
    (1, 12, 1, 4999.99, 0),
    (2, 5, 2, 49.99, 0),
    (2, 16, 1, 9999.99, 0),
    (2, 22, 1, 69.99, 0),
    (2, 30, 1, 79.99, 0),
    (3, 2, 1, 1499.99, 0),
    (4, 3, 1, 299.99, 0),
    (4, 25, 1, 89.99, 0),
    (4, 50, 2, 89.99, 0),
    (5, 7, 1, 129.99, 0),
    (5, 15, 1, 399.99, 0),
    (5, 28, 1, 149.99, 0),
    (5, 51, 1, 499.99, 0),
    (5, 47, 1, 299.99, 0),
    (6, 10, 1, 699.99, 0),
    (6, 66, 1, 499.99, 0),
    (7, 78, 1, 99.99, 0),
    (7, 23, 1, 1999.99, 0),
    (7, 35, 1, 49.99, 0),
    (8, 14, 1, 299.99, 0),
    (9, 6, 1, 199.99, 0),
    (9, 20, 1, 499.99, 0),
    (9, 27, 1, 49.99, 0),
    (9, 40, 1, 199.99, 0),
    (10, 9, 1, 249.99, 0),
    (10, 17, 1, 199.99, 0),
    (10, 26, 1, 59.99, 0),
    (10, 74, 1, 149.99, 0),
    (10, 41, 1, 899.99, 0),
    (11, 11, 1, 1299.99, 0),
    (11, 92, 1, 79.99, 0),
    (12, 4, 1, 79.99, 0),
    (12, 99, 1, 2499.99, 0),
    (12, 52, 1, 1799.99, 0),
    (13, 24, 1, 399.99, 0),
    (14, 13, 1, 999.99, 0),
    (14, 31, 1, 2499.99, 0),
    (14, 42, 1, 1099.99, 0),
    (14, 61, 1, 699.99, 0),
    (15, 21, 1, 19.99, 0),
    (15, 34, 1, 129.99, 0),
    (16, 32, 1, 29.99, 0),
    (16, 36, 1, 299.99, 0),
    (16, 63, 1, 99.99, 0),
    (17, 48, 1, 199.99, 0),
    (18, 66, 1, 499.99, 0),
    (18, 67, 1, 199.99, 0),
    (18, 43, 1, 199.99, 0),
    (18, 68, 1, 199.99, 0),
    (18, 16, 1, 9999.99, 0),
    (19, 91, 1, 599.99, 0),
    (19, 22, 1, 69.99, 0),
    (20, 44, 1, 49.99, 0),
    (20, 25, 1, 89.99, 0),
    (20, 47, 1, 299.99, 0),
    (21, 3, 1, 299.99, 0),
    (21, 51, 1, 499.99, 0),
    (22, 6, 2, 199.99, 0),
    (22, 52, 1, 1799.99, 0),
    (22, 40, 1, 199.99, 0),
    (23, 71, 1, 599.99, 0),
    (23, 17, 1, 199.99, 0);
    
    
    
    
-- 2. I create queries using various sql language techniques, in this project I use MySQL DBMS.


-- 2.1 Simple queries.


-- 2.1.1 Look for products arranged alphabetically by name.
select *
from products
order by productname asc;


-- 2.1.2 Find the most expensive product. 
select 
	productname,
    price
from products 
	order by price desc
    limit 1; 
 
 
-- 2.1.2*- for the MSSQL syntax
select top1
	productname,
    price
from products 
	order by price desc;

   
-- 2.1.3- Fetch all orders shipped to Anycity.     
select * 
from orders
where shipcity = 'Anycity';


-- 2.1.4- Fetch all products that contain 'All-in-one' phrase in their name.
select *
from products
where productname like '%All-in-one%';


-- 2.1.5- Extract orders placed between 2023-10-10 and 2023-10-20, ordered from the last one made. 
select *
from orders
where orderdate between '2024-10-10' and '2024-10-20'
order by orderdate desc;


-- 2.1.5*- alternative syntax
select * 
from orders 
where orderdate >= '2024-10-10' and orderdate <= '2024-10-20'
order by orderdate desc;


-- 2.1.6- Find orders that have not yet been shipped.
select *
from orders 
where shipdate is null;






-- 2.2 JOINs- joining tables. 


-- 2.2.1- Extract information from the database about what products were ordered for each order number. 
select 
	oi.orderid,
    p.productname
from orderinfo oi
	inner join products p on oi.productid = p.productid
order by orderid;


-- 2.2.1*- using NATURAL JOIN 
select 
	orderid,
    productname
from orderinfo 
	natural join products 
order by orderid;


-- 2.2.2- Extract information from the database about what products were ordered for each order number, indicate the dates of the orders, the names of the customers who made the orders, and the names of the employees who handled the orders. 
select 
	oi.orderid,
    p.productname,
    o.orderdate,
    c.firstname,
    c.lastname,
	e.firstname,
    e.lastname
from orderinfo oi
	inner join products p on oi.productid = p.productid
    inner join orders o on oi.orderid = o.orderid
    inner join customers c on o.customerid = c.customerid
	inner join employees e on o.employeeid = e.employeeid
order by orderid;


-- 2.2.3- Show the dates on which each product was purchased. 
select 
	o.orderdate,
	p.productname
from products p 
	inner join orderinfo oi on p.productid = oi.productid
    inner join orders o on oi.orderid = o.orderid
order by o.orderdate desc;


-- 2.2.4-  Find products which were never ordered.
select 
	p.*,
    oi.orderid
from products p
	left join orderinfo oi on p.productid = oi.productid
where orderid is null;


-- 2.2.4*- Using RIGHT JOIN
select 
	p.productname,
    oi.orderid
from orderinfo oi 
	right join products p on p.productid = oi.productid
where orderid is null;


-- 2.2.5- Based on the employees table, indicate who is the supervisor of a particular employee.
select 
	e.firstname as 'employee- first name',
    e.lastname as 'employee- last name',
    b.firstname as 'supervisor- first name',
    b.lastname as 'supervisor- last name'
from employees e 
	join employees b on e.supervisorsid = b.employeeid;






-- 2.3- GROUP BY- data grouping.


-- 2.3.1- How many products in our store belong to each product category. 
select 
	pc.categoryname,
    count(p.categoryid) as 'number_of_products'
from productcategories pc  
	inner join products p on pc.categoryid = p.categoryid
group by pc.categoryname
order by number_of_products desc;


-- 2.3.2- Which ten products were ordered the most. 
select 
	p.productname,
    count(oi.productid) as 'number_of_orders'
from products p
	inner join orderinfo oi on p.productid = oi.productid
group by p.productname
order by number_of_orders desc
limit 10;


-- 2.3.3- Fetch orders over $1,000 along with their value.
select 
	orderid,
	sum(quantity * unitprice) as 'order_value'
from orderinfo 
group by orderid
having order_value > 1000;
    
    
-- 2.3.4 Return the value of purchases for all customers. Order from largest to smallest purchase total. 
select 
	c.customerid,
	c.firstname,
    c.lastname,
    sum(oi.quantity*oi.unitprice) as 'purchase_total'
from customers c 
	inner join orders o on c.customerid = o.customerid
    inner join orderinfo oi on o.orderid = oi.orderid
group by c.customerid
order by purchase_total desc;


-- 2.3.5- For each product category, calculate their total, average, minimum and maximum order value. 
select
	pc.categoryname, 	
    sum(quantity * unitprice) as 'total_order_value_for_each_category',
    round(avg(quantity * unitprice),2) as 'average_order_value_for_each_category',
    min(quantity * unitprice) as 'min_order_value_for_each_category',
    max(quantity * unitprice) as 'max_order_value_for_each_category'
from orderinfo oi
	inner join orders o on oi.orderid = o.orderid
    inner join products p on oi.productid = p.productid
	inner join productcategories pc on p.categoryid = pc.categoryid
	group by pc.categoryid;
    
    
    
    
    
    
-- 2.4- Operations on Data Sets: UNION, INTERSECT, EXCEPT Clauses


-- 2.4.1- Display in one table personal data of customers and employees.

select 
	firstname, 
    lastname, 
    email,
    phone,
    address,
    city,
    postalcode,
    country,
    'customer' affiliation
from customers 

union 

select 
	firstname, 
    lastname, 
    email,
    phone,
    null,
    null,
    null,
    null,
    'emp'
from employees; 


-- 2.4.2- Find customers who ordered and employees who operated orders for Quantum SSD 1TB.
select 
	c.firstname,
    c.lastname, 
    p.productname,
    'customer' affiliation 
from customers c
	inner join orders o on c.customerid = o.customerid
    inner join orderinfo oi on o.orderid = oi.orderid
    inner join products p on oi.productid = p.productid
where p.productname = 'Quantum SSD 1TB'

union

select 
	e.firstname,
    e.lastname, 
    p.productname,
    'employee'
from employees e
	inner join orders o on e.employeeid = o.customerid
    inner join orderinfo oi on o.orderid = oi.orderid
    inner join products p on oi.productid = p.productid
where p.productname = 'Quantum SSD 1TB';


-- 2.4.3- Find customers who ordered Infinite Storage HDD and Office Suite Pro.
select 
	c.firstname,
    c.lastname
from customers c
	inner join orders o on c.customerid = o.customerid
    inner join orderinfo oi on o.orderid = oi.orderid
    inner join products p on oi.productid = p.productid
where p.productname = 'NAS Storage Device'

intersect

select 
	c.firstname,
    c.lastname
from customers c
	inner join orders o on c.customerid = o.customerid
    inner join orderinfo oi on o.orderid = oi.orderid
    inner join products p on oi.productid = p.productid
where p.productname = 'Portable Monitor';


-- 2.4.4- Fetch customers which ordered Infinity Display 27" but never ordered Wireless Gaming Mouse.

select 
	c.firstname,
    c.lastname
from customers c
	inner join orders o on c.customerid = o.customerid
    inner join orderinfo oi on o.orderid = oi.orderid
    inner join products p on oi.productid = p.productid
where p.productname = 'Infinity Display 27"' and c.customerid = o.customerid

except

select 
	c.firstname,
    c.lastname
from customers c
	inner join orders o on c.customerid = o.customerid
    inner join orderinfo oi on o.orderid = oi.orderid
    inner join products p on oi.productid = p.productid
where p.productname = 'Wireless Gaming Mouse' and c.customerid = o.customerid;






-- 2.5- Subqueries, CTEs and Temporary Tables.


-- 2.5.1- Fetch the cheapest products. 
select *
from products 
	where price = (
					select 
						min(price)
                    from products);
        
        
-- 2.5.1.1- Using CTE- Fetch the cheapest products.
with min_price (min) as 
(
select 
	min(price) as 'min'
from products)
select p.*
from products p
	join min_price mp 
where p.price = mp.min;


-- 2.5.2- Find products with prices higher than all products in the Desktop Computers category.
select *
from products 
where price > all (
					select 
						price 
                    from products p 
						inner join productcategories pc on p.categoryid = pc.categoryid
					where categoryname = 'desktop computers');


-- 2.5.2.1- Using CTE- Find products with prices higher than all products in the Desktop Computers category.
with desktop_computers_prices (price) as 
(
select 
	price as 'price' 
from products p 
	inner join productcategories pc on p.categoryid = pc.categoryid
where categoryname = 'desktop computers')
select *
from products 
where price > all (
					select *
                    from desktop_computers_prices);


-- 2.5.3- Fetch the number of orders in which customers purchased only one type of product.
select 
	count(*) as 'number_of_single_product_orders'
from (
		select 
			count(*)
		from orderinfo 
        group by orderid
        having count(*) = 1
		)subq;
        
        
-- 2.5.3.1- Using CTE-  Fetch the number of orders in which customers purchased only one type of product.
with single_product_orders (single_orders) as 
(
select 
	count(*) as 'single_orders'
from orderinfo 
group by orderid
having count(*) = 1)
select 
	count(*) as 'number_of_single_product_orders'
from single_product_orders;
      
      
-- 2.5.4- Find clients who made the most number of orders.
select 
	c.firstname, 
    c.lastname,
    count(*) as 'number_of_orders'
from customers c 
	inner join orders o on c.customerid = o.customerid
	group by c.customerid
having number_of_orders = (
							select  
							 count(*) as 'max'
						    from orders
							group by customerid
							order by max desc
							limit 1);
         
         
-- 2.5.4.1- Using CTE- Find clients who made the most number of orders.
with max_num_of_orders (customerid, max) as 
(
select  
	customerid,
	count(*) as 'max'
from orders
group by customerid
order by max desc
limit 1)
select 
	c.firstname, 
	c.lastname,
	count(*) as 'number_of_orders'
from customers c 
	join orders o on c.customerid = o.customerid
    cross join max_num_of_orders mnoo
group by c.customerid, mnoo.max
having number_of_orders = mnoo.max; 


-- 2.5.5- Find products which were never ordered.
select 
	*
from products 
	where productid not in (
							select 
								productid
							from orderinfo 
                            where productid is not null); 


-- 2.5.5.1- Using CTE- Find products which were never ordered.
with ordered_products (product_id) as 
(
select 
	productid as 'product_id'
from orderinfo 
where productid is not null)
select *
from products 
where productid not in (
						select 
                        product_id
                        from ordered_products);



-- 2.5.6- Find product categories whose sales were better than the average sales across all categories.  
select *
from (
		select 
			pc.categoryid,
			pc.categoryname,
			sum(subq_tbp.total_by_productid) as 'total_by_category'
		from (select 
			oi.productid, 
			p.categoryid as 'category',
			sum(oi.quantity * oi.unitprice) 'total_by_productid'
			from orderinfo oi
				inner join products p on oi.productid = p.productid 
			group by oi.productid) subq_tbp
			inner join productcategories pc on pc.categoryid = subq_tbp.category
		group by pc.categoryid) subq
where subq.total_by_category > (select 
								 round(avg(total_by_category),2) 'avg_for_all_categories'
								from (
									select 
										pc.categoryid,
										pc.categoryname,
										sum(subq_tbp.total_by_productid) as 'total_by_category'
									from (select 
										oi.productid, 
										p.categoryid as 'category',
										sum(oi.quantity * oi.unitprice) 'total_by_productid'
										from orderinfo oi
											inner join products p on oi.productid = p.productid 
										group by productid) subq_tbp
										inner join productcategories pc on pc.categoryid = subq_tbp.category
									group by pc.categoryid) subq_tbc)
order by subq.total_by_category desc;


-- 2.5.6.1- Using CTE- Find product categories whose sales were better than the average sales across all categories. 
with total_sales_by_products (productid, category, total_by_productid) as 
(
select 
	oi.productid,
	p.categoryid as 'category',
	sum(oi.quantity * oi.unitprice) as 'total_by_productid'
from orderinfo oi
	inner join products p on oi.productid = p.productid 
group by oi.productid
), total_sales_by_category (categoryid, categoryname, total_by_category) as 
(
select 
	pc.categoryid,
	pc.categoryname as 'category',
	sum(tsbp.total_by_productid) as 'total_by_category'
from total_sales_by_products tsbp
	inner join productcategories pc on pc.categoryid = tsbp.category
group by pc.categoryid
), avg_sales (avg_for_all_categories) as
(
select 
 round(avg(total_by_category),2) 'avg_for_all_categories'
from total_sales_by_category
)
select *
from total_sales_by_category tsbc
	join avg_sales avs
where tsbc.total_by_category > avs.avg_for_all_categories
order by tsbc.total_by_category desc;


-- 2.5.6.2- Using Temporary Tables- Find product categories whose sales were better than the average sales across all categories. 
create temporary table total_sales_by_products
select 
	oi.productid,
	p.categoryid as 'category',
	sum(oi.quantity * oi.unitprice) as 'total_by_productid'
from orderinfo oi
	inner join products p on oi.productid = p.productid 
group by oi.productid;

create temporary table total_sales_by_category
select 
	pc.categoryid,
	pc.categoryname,
	sum(tsbp.total_by_productid) as 'total_by_category'
from total_sales_by_products tsbp
	inner join productcategories pc on pc.categoryid = tsbp.category
group by pc.categoryid;

create temporary table avg_sales
select 
 round(avg(total_by_category),2) 'avg_for_all_categories'
from total_sales_by_category; 
    
select * 
from total_sales_by_category tsbc
	join avg_sales avs
where tsbc.total_by_category > avs.avg_for_all_categories
order by tsbc.total_by_category desc;






-- 2.6- Correlated subqueries.


-- 2.6.1- Fetch products which are more expensive or at the same price as average price of products in each category. 
select  
	m.categoryid,
	m.productname,   
    m.price
from products m
	where price >= (
					select 
						avg(price)
					from products s
                    where m.categoryid = s.categoryid)
order by categoryid;


-- 2.6.2- Fetch customers which ordered Infinity Display 27" but never ordered Wireless Gaming Mouse.
select 
	c.firstname, 
    c.lastname
from customers c
where exists (
			  select *
			  from orders o
				inner join orderinfo oi on o.orderid = oi.orderid
				inner join products p on oi.productid = p.productid
			  where p.productname = 'Infinity Display 27"' and c.customerid = o.customerid)
and not exists (
			    select *
			    from orders o
				  inner join orderinfo oi on o.orderid = oi.orderid
				  inner join products p on oi.productid = p.productid
			    where p.productname = 'Wireless Gaming Mouse' and c.customerid = o.customerid);
 
 
 
 
 

-- 2.7- Window Functions.
 

-- 2.7.1- Find all models of keyboards with the average price of all keyboards.
select 
	productname,
    round(avg(price)over(),2) as 'average_price'
from products
where productname like '%keyboard%';

-- 2.7.2- Fetch maximum price per products in each category and display all products sorted by category, at the beginning of table display category name.
select
	pc.categoryname,
	p.*,
    max(p.price)over(partition by categoryid) as 'maximum_products_price'
from products p
	inner join productcategories pc on p.categoryid = pc.categoryid;

-- 2.7.3- List products in each category in ascending order of price.
select
	pc.categoryid,
	pc.categoryname,
    p.productname,
    p.price,
    row_number()over(partition by pc.categoryid order by p.price) as 'pricing_sequence'
from products p
	inner join productcategories pc on p.categoryid = pc.categoryid;    

-- 2.7.4- Display all products in each category whose prices are among the four highest price values. 
select *
from (
select 
	pc.categoryid,
	pc.categoryname,
    p.productname,
    p.price,
    dense_rank()over(partition by pc.categoryid order by p.price desc) as 'pricing_sequence'
from products p
	inner join productcategories pc on p.categoryid = pc.categoryid)subq
where subq.pricing_sequence <= 4;

-- 2.7.5- Check if the order value was greater, equal to, or lower than the previous one.
select 
	subq.orderid,
	subq.total_by_order,
	lag(subq.total_by_order,1,null)over() as 'prev_order_value',
    case when lag(subq.total_by_order,1,null)over() < subq.total_by_order then 'Order value is higher than the previous one.'
    when lag(subq.total_by_order,1,null)over() > subq.total_by_order then 'Order value is lower than the previous one.'
    when lag(subq.total_by_order,1,null)over() = subq.total_by_order then 'Order value is equal to the previous one.'
    else 'Nothing to compare.'end as 'order_value_lower/higher/equal_to_previous' 
from (select distinct
	orderid,
	round(sum(oi.quantity*unitprice)over(partition by oi.orderid order by orderid),2) as 'total_by_order'
	from orderinfo oi) subq;
    
-- 2.7.6- Check the cumulative value of orders after each order. 
select 
subq.orderid,
subq.total_by_order,
sum(subq.total_by_order)over(order by subq.orderid) as 'rolling_total'
from (select distinct
		orderid,
		round(sum(oi.quantity*unitprice)over(partition by oi.orderid order by orderid),2) as 'total_by_order'
		from orderinfo oi)subq;






-- 2.8- Stored Procedures. 


-- 2.8.1- Create a stored procedure that enables us to call all orders with a breakdown of order size categories in which small orders are less than or equal to 1,000, medium orders are greater than 1,000 but less than or equal to 5,000, and large orders are greater than 5,000.

use pcmasterrace;
drop procedure if exists order_size_categories;

delimiter $$
use pcmasterrace$$
create procedure order_size_categories()
begin 
    select 
		orderid,
        sum(quantity*unitprice) as 'small_orders'
	from orderinfo 
    group by orderid
    having small_orders <= 1000;
	select 
		orderid,
        sum(quantity*unitprice) as 'medium_orders'
	from orderinfo 
    group by orderid
    having medium_orders > 1000 and medium_orders <= 5000;
    select 
		orderid,
        sum(quantity*unitprice) as 'large_orders'
	from orderinfo 
    group by orderid
    having large_orders > 5000;
end$$

delimiter ; 

call order_size_categories();


-- 2.8.2- Create a stored procedure that enables us to retrieve the order value using the orderID as a parameter.

use pcmasterrace;
drop procedure if exists order_values;

delimiter $$
use pcmasterrace$$
create procedure order_values(param_orderid int)
begin 
    select 
		orderid,
        sum(quantity*unitprice) as 'order_value'
	from orderinfo 
    group by orderid
    having orderid = param_orderid;
end$$

delimiter ;

call order_values(11);


-- 2.8.3- Create a stored procedure that enables us to retrieve the total order value for each customer using the customerID as a parameter.

use pcmasterrace;
drop procedure if exists order_total;

delimiter $$
use pcmasterrace$$
create procedure order_total(param_customerid int)
begin 
	select 
		c.customerid,
		c.firstname,
		c.lastname,
		sum(oi.quantity*oi.unitprice) as 'order_total'
	from customers c 
		inner join orders o on c.customerid = o.customerid
		inner join orderinfo oi on o.orderid = oi.orderid
	group by c.customerid
    having c.customerid = param_customerid;
end$$

delimiter ;

call order_total(10);
