CREATE DATABASE LIBRARIES;
USE LIBRARIES;

CREATE TABLE Bookss
( BookID int PRIMARY KEY,
  Title char(30),
  Author char(30),
  Price int,
  Quantity int,
  PublishDate date);
  DESC Bookss;
  
  INSERT INTO Bookss (BookID,Title,Author,Price,Quantity,PublishDate) VALUES
  (101,'Python','Eric Mathes',500,'8','2019-05-10'),
  (102,'Harry Potter','Harry',300,'10','2000-02-14'),
  (103,'Biology','Chinchu',800,'12','1947-03-15'),
  (104,'Artofbeingalone','Manish','13',500,'2002-07-07'),
  (105,'RichDad','Deeksha',600,'7','1897-09-06');
  SELECT * FROM Bookss;

  CREATE TABLE Customer
  (CustomerID int PRIMARY KEY,
   Name char(30),
   Email varchar(30),
   JoinDate date);
   
   INSERT INTO Customer (CustomerID,Name,Email,JoinDate) VALUES
   (201,'Deeksha','deeksha123@gmail.com','2024-06-03'),
   (202,'Chinchana','chinchu456@gmail.com','2006-07-08'),
   (203,'Mani','mani07@gmail.com','2002-04-11'),
   (204,'Mithun','mithu567@gmail.com','2011-05-09'),
   (205,'Preethi','preethi@gmail.com','2006-09-04');
   SELECT * FROM Customer;
   
   CREATE TABLE ORDERS
   (OrderID int PRIMARY KEY,
    CustomerID int,
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
    BookID int,
    FOREIGN KEY (BookID) REFERENCES Books (BookID),
    OrderDate date,
    Quantity int);
    
    INSERT INTO ORDERS (OrderID,CustomerID,BookID,OrderDate,Quantity) VALUES
    (301,201,101,'2021-06-08',5),
    (302,202,102,'2020-07-09',4),
    (303,203,103,'2019-08-10',3),
    (304,204,104,'2018-09-11',2),
    (305,205,105,'2017-10-12',1);
    SELECT * FROM ORDERS;
    
    -- Display all customer names in uppercase.
    SELECT UPPER(Name) AS UPPERNAME FROM Customer;
    -- output:
    /* # UPPERNAME
'DEEKSHA'
'CHINCHANA'
'MANI'
'MITHUN'
'PREETHI' */

    -- Show all customer names in lowercase.
    SELECT LOWER(Name) AS LOWERNAME FROM Customer;
    -- output:
    /* # LOWERNAME
'deeksha'
'chinchana'
'mani'
'mithun'
'preethi' */

    -- Extract the first 3 letters of each book title.
    SELECT LEFT(Title,3) AS LENGTHTITLE FROM Books;
    -- output:
    /* # LENGTHTITLE
'Pyt'
'Har'
'Bio'
'Art'
'Ric' */

-- Display each customer’s email domain (after @).
SELECT RIGHT(Email,9) AS RIGHTDOMAIN FROM Customer;
-- output:
/* # RIGHTDOMAIN
'gmail.com'
'gmail.com'
'gmail.com'
'gmail.com'
'gmail.com' */

-- Find the length of each book title.
SELECT LENGTH(Title) AS TITLELENGTH FROM Books;
-- output:
/* # TITLELENGTH
'6'
'12'
'7'
'15'
'7' */

-- Concatenate Author name and Book title as a single string.
SELECT CONCAT(Author,Title) AS CONCATSTRING FROM Books;
-- output:
/* # CONCATSTRING
'Eric MathesPython'
'HarryHarry Potter'
'ChinchuBiology'
'ManishArtofbeingalone'
'DeekshaRichDad' */

-- Show book titles where the author’s name contains ‘a’.
SELECT Title FROM Books WHERE Author Like 'A%';
-- output:
/* Title */

-- Display the year in which each book was published.
SELECT Title,EXTRACT(YEAR FROM PublishDate) AS PUBLISHYEAR FROM Books;
-- output:
/* # Title, PUBLISHYEAR
'Python', '2019'
'Harry Potter', '2000'
'Biology', '1947'
'Artofbeingalone', '2002'
'RichDad', '1897' */

-- Find the month name in which each customer joined.
SELECT JoinDate,EXTRACT(MONTH FROM JoinDate) AS JOINMONTH FROM Customer;
-- output:
/* # JoinDate, JOINMONTH
'2024-06-03', '6'
'2006-07-08', '7'
'2002-04-11', '4'
'2011-05-09', '5'
'2006-09-04', '9' */

-- List customers who joined in 2021.
SELECT Name FROM Customer WHERE YEAR(JoinDate) = 2021;
-- output:
/* Name */

-- Find the day name on which each order was placed.
SELECT OrderDate,DAYNAME(OrderDate) AS ORDERDAY FROM ORDERS;
-- output:
/* # OrderDate, ORDERDAY
'2021-06-08', 'Tuesday'
'2020-07-09', 'Thursday'
'2019-08-10', 'Saturday'
'2018-09-11', 'Tuesday'
'2017-10-12', 'Thursday' */

-- Display the age of each book (in years since published).
SELECT Title,YEAR(CURDATE()) - YEAR(PublishDate) AS BookAge FROM Books;
-- output:
/* # Title, BookAge
'Python', '6'
'Harry Potter', '25'
'Biology', '78'
'Artofbeingalone', '23'
'RichDad', '128' */


-- Replace the word "Book" with "Text" in titles (if present).
UPDATE Books SET Title = REPLACE(Title, 'Book', 'Text');

-- Find the number of days between today and each customer’s join date.
SELECT CustomerID, JoinDate, DATEDIFF(CURDATE(), JoinDate) AS DaysSinceJoin FROM Customer;
-- output:
# CustomerID, JoinDate, DaysSinceJoin
/*'201', '2024-06-03', '471'
'202', '2006-07-08', '7011'
'203', '2002-04-11', '8560'
'204', '2011-05-09', '5245'
'205', '2006-09-04', '6953'*/

-- Show all orders placed in the month of December (any year).
SELECT * FROM Orders WHERE MONTH(OrderDate) = 12;
-- output:
/*OrderID, CustomerID, BookID, OrderDate, Quantity*/

-- Find the total number of books available in the store.
SELECT SUM(Quantity) AS TotalBooksAvailable FROM Bookss;
-- output:
/* # TotalBooksAvailable
'537' */

-- Find the average price of books.
SELECT AVG(Price) AS AverageBookPrice FROM Bookss;
-- output:# AverageBookPrice
/*'442.6000'*/

-- Find the maximum and minimum book price.
SELECT MAX(Price) AS MaxBookPrice, MIN(Price) AS MinBookPrice FROM Books;
-- output:# MaxBookPrice, MinBookPrice
/*'800', '300'*/

--  Count how many customers joined after 2020.
SELECT COUNT(*) AS CustomerJoinedAfter2020 FROM Customer WHERE JoinDate > '2020-12-31';
-- output :# CustomerJoinedAfter2020
/*'1'*/

-- Find the total number of books ordered (all orders combined).
SELECT SUM(Quantity) AS TotalBooksOrdered FROM Orders;
-- output:# TotalBooksOrdered
/*'15'*/

-- Show the total quantity of books ordered per customer.
SELECT Customer.CustomerID,Customer.Name,SUM(Orders.Quantity) AS TotalBooksOrdered FROM Customer JOIN Orders ON Customer.CustomerID = Orders.CustomerID GROUP BY Customer.CustomerID,Customer.Name;
-- output:
/* # CustomerID, Name, TotalBooksOrdered
        '201', 'Deeksha', '5'
		'202', 'Chinchana', '4'
		'203', 'Mani', '3'
		'204', 'Mithun', '2'
		'205', 'Preethi', '1' */

-- Find the average order quantity per book.
SELECT BookID, AVG(Quantity) AS AvgOrderQuantity FROM Orders GROUP BY BookID;
-- output:# BookID, AvgOrderQuantity
/*          '101', '5.0000'
            '102', '4.0000'
			'103', '3.0000'
            '104', '2.0000'
            '105', '1.0000'*/

-- Find the book with the highest total quantity ordered.
SELECT BookID FROM Orders GROUP BY BookID ORDER BY SUM(Quantity);
# BookID
/*'105'
'104'
'103'
'102'
'101'*/

-- Show the total revenue generated per book (Price × Quantity).
SELECT BookID, SUM(Price * Quantity) AS TotalRevenue FROM Bookss GROUP BY BookID;
-- output:
/* # BookID, TotalRevenue
      '101', '4000'
      '102', '3000'
      '103', '9600'
      '104', '6500'
      '105', '4200' */

-- Find the total number of orders placed each year.
SELECT YEAR(OrderDate) AS OrderYear, COUNT(*) AS TotalOrders FROM Orders GROUP BY YEAR(OrderDate);
-- output:# OrderYear, TotalOrders
/*'2021', '1'
'2020', '1'
'2019', '1'
'2018', '1'
'2017', '1'*/
