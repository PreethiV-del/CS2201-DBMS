-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Preethi V
-- USN: 1RUA24BCA0071
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 
CREATE DATABASE ECOMMERCE;
USE ECOMMERCE;

-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50))
CREATE TABLE Customers
( Customer_id int PRIMARY KEY,
  Customer_name varchar(50),
  City varchar(50));
-- insert 5 records
INSERT INTO Customers (Customer_id,Customer_name,City) VALUES
(1,'Preethi','Bangalore'),
(2,'Chinchana','Mumbai'),
(3,'Deeksha','Delhi'),
(4,'Mani','Mysore'),
(5,'Mithun','Coorg');
SELECT * FROM Customers;

-- TABLE:02 Orders Table

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,
CREATE TABLE Orders
( order_id INT PRIMARY KEY,
  Customer_id INT,
  FOREIGN KEY (Customer_id) REFERENCES Customers (Customer_id),
  product_name VARCHAR(50),
  order_date DATE);
  
-- insert 5 records
INSERT INTO Orders (order_id,Customer_id,product_name,order_date) VALUES
(10,1,'Mobile','2025-08-26'),
(11,2,'Laptop','2025-08-21'),
(12,3,'StudyTable','2025-08-18'),
(13,4,'Clothes','2025-08-15'),
(14,5,'Watch','2025-08-10');
SELECT * FROM Orders;

-- TASK FOR STUDENTS 

 
-- Write and Execute Queries
/*
1. Inner Join – 
   Find all orders placed by customers from the city "Bangalore."
   List all customers with the products they ordered.
   Show customer names and their order dates.
   Display order IDs with the corresponding customer names.
   Find the number of orders placed by each customer.
   Show city names along with the products ordered by customers.
*/
-- QUERY:
SELECT c.City,o.product_name
FROM Orders o INNER JOIN Customers c ON o.Customer_id = c.Customer_id
WHERE c.City = 'Bangalore';
-- OUTPUT:
/* # City, product_name
'Bangalore', 'Mobile' */


SELECT Customer_name,product_name
FROM Customers,Orders
WHERE Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* # Customer_name, product_name
'Preethi', 'Mobile'
'Chinchana', 'Laptop'
'Deeksha', 'StudyTable'
'Mani', 'Clothes'
'Mithun', 'Watch' */

SELECT Customer_name,Order_date
FROM Customers,Orders
WHERE Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* # Customer_name, Order_date
'Preethi', '2025-08-26'
'Chinchana', '2025-08-21'
'Deeksha', '2025-08-18'
'Mani', '2025-08-15'
'Mithun', '2025-08-10' */

SELECT Order_id,Customer_name
FROM Orders,Customers
WHERE Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* # Order_id, Customer_name
'10', 'Preethi'
'11', 'Chinchana'
'12', 'Deeksha'
'13', 'Mani'
'14', 'Mithun' */

SELECT Customer_name, COUNT(order_id) AS OrderCount
FROM Customers, Orders
WHERE Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.Customer_name;
-- OUTPUT:
/* # Customer_name, OrderCount
'Preethi', '1'
'Chinchana', '1'
'Deeksha', '1'
'Mani', '1'
'Mithun', '1' */

SELECT City,product_name
FROM Customers,Orders
WHERE Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* # City, product_name
'Bangalore', 'Mobile'
'Mumbai', 'Laptop'
'Delhi', 'StudyTable'
'Mysore', 'Clothes'
'Coorg', 'Watch' */

/*
2  Left Outer Join – 
    Find all customers and their orders, even if a customer has no orders.
    List all customers and the products they ordered.
    Show customer IDs, names, and their order IDs.
    Find the total number of orders (if any) placed by each customer.
    Retrieve customers who have not placed any orders.
	Display customer names with their order dates. */
-- Write your code below this line along with the output 

SELECT Customer_name,order_id,product_name
FROM Customers LEFT OUTER JOIN Orders
ON Customers.Customer_id = Orders.Customer_id;
-- output:
/* # Customer_name, order_id, product_name
'Preethi', '10', 'Mobile'
'Chinchana', '11', 'Laptop'
'Deeksha', '12', 'StudyTable'
'Mani', '13', 'Clothes'
'Mithun', '14', 'Watch' */

SELECT Customer_name,product_name
FROM Customers LEFT OUTER JOIN Orders
ON Customers.Customer_id = Orders.Customer_id;
-- output:
/* # Customer_name, product_name
'Preethi', 'Mobile'
'Chinchana', 'Laptop'
'Deeksha', 'StudyTable'
'Mani', 'Clothes'
'Mithun', 'Watch' */

SELECT Customers.Customer_id,Customer_name,order_id
FROM Customers LEFT OUTER JOIN Orders
ON Customers.Customer_id = Orders.Customer_id;
-- output:
/* # Customer_id, Customer_name, order_id
'1', 'Preethi', '10'
'2', 'Chinchana', '11'
'3', 'Deeksha', '12'
'4', 'Mani', '13'
'5', 'Mithun', '14' */

SELECT Customer_name, COUNT(order_id) AS OrderCount
FROM Customers LEFT OUTER JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.Customer_name;
-- output:
/* # Customer_name, OrderCount
'Preethi', '1'
'Chinchana', '1'
'Deeksha', '1'
'Mani', '1'
'Mithun', '1' */

SELECT Customer_name
FROM Customers LEFT OUTER JOIN Orders
ON Customers.Customer_id = Orders.Customer_id
WHERE order_id IS NULL;
 -- output:
 /* Customer_name */
 
 SELECT Customer_name,order_date
 FROM Customers LEFT OUTER JOIN Orders
 ON Customers.customer_id = Orders.customer_id;
 -- output:
 /* # Customer_name, order_date
'Preethi', '2025-08-26'
'Chinchana', '2025-08-21'
'Deeksha', '2025-08-18'
'Mani', '2025-08-15'
'Mithun', '2025-08-10' */

 
/* 3: Right Outer Join – 
      Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
      Show all orders with the customer names.
      Display product names with the customers who ordered them.
	  List order IDs with customer cities.
      Find the number of orders per customer (include those without orders).
	  Retrieve customers who do not have any matching orders.
     Write your code below this line along with the output 
 */

SELECT product_name,Customer_name
FROM Orders RIGHT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id;
-- output:
/* # product_name, Customer_name
'Mobile', 'Preethi'
'Laptop', 'Chinchana'
'StudyTable', 'Deeksha'
'Clothes', 'Mani'
'Watch', 'Mithun' */

SELECT order_id,product_name,Customer_name
FROM Orders RIGHT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id;
-- output:
/* # order_id, product_name, Customer_name
'10', 'Mobile', 'Preethi'
'11', 'Laptop', 'Chinchana'
'12', 'StudyTable', 'Deeksha'
'13', 'Clothes', 'Mani'
'14', 'Watch', 'Mithun' */

SELECT Customers.customer_id,Customer_name,product_name
FROM Customers RIGHT OUTER JOIN Orders
ON Customers.customer_id = Orders.customer_id;
-- output:
/* # customer_id, Customer_name, product_name
'1', 'Preethi', 'Mobile'
'2', 'Chinchana', 'Laptop'
'3', 'Deeksha', 'StudyTable'
'4', 'Mani', 'Clothes'
'5', 'Mithun', 'Watch' */

SELECT order_id,City
FROM Orders RIGHT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id;
-- output:
/* # order_id, City
'10', 'Bangalore'
'11', 'Mumbai'
'12', 'Delhi'
'13', 'Mysore'
'14', 'Coorg' */

SELECT Customer_name, COUNT(order_id) AS OrderCount
FROM Customers RIGHT OUTER JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.Customer_name;
-- OUTPUT:
/* # Customer_name, OrderCount
'Preethi', '1'
'Chinchana', '1'
'Deeksha', '1'
'Mani', '1'
'Mithun', '1' */

SELECT Customer_name
FROM Customers RIGHT OUTER JOIN Orders
ON Customers.Customer_id = Orders.Customer_id
WHERE order_id IS NULL;
-- OUTPUT:
/* Customer_name */

/* 4: Full Outer Join – 
        Find all customers and their orders, including those customers with no orders and orders without a customer.
        List all customers and products, whether they placed an order or not.
        Show customer IDs with order IDs (include unmatched ones).
		Display customer names with order dates.
		Find all unmatched records (customers without orders and orders without customers).
        Show customer cities with products.
     Write your code below this line along with the output 
  */   
  
SELECT order_id,product_name,Customer_name
FROM Orders LEFT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id
UNION
SELECT order_id,product_name,Customer_name
FROM Orders RIGHT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id;
  -- output :
  /* # order_id, product_name, Customer_name
'10', 'Mobile', 'Preethi'
'11', 'Laptop', 'Chinchana'
'12', 'StudyTable', 'Deeksha'
'13', 'Clothes', 'Mani'
'14', 'Watch', 'Mithun' */

SELECT product_name,Customer_name
FROM Orders LEFT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id
UNION
SELECT product_name,Customer_name
FROM Orders RIGHT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id; 
-- output:
/* # product_name, Customer_name
'Mobile', 'Preethi'
'Laptop', 'Chinchana'
'StudyTable', 'Deeksha'
'Clothes', 'Mani'
'Watch', 'Mithun' */

SELECT Customers.customer_id,order_id
FROM Orders LEFT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.customer_id,order_id
FROM Orders RIGHT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id; 
-- output:
/* # customer_id, order_id
'1', '10'
'2', '11'
'3', '12'
'4', '13'
'5', '14' */

SELECT Customer_name,order_date
FROM Orders LEFT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customer_name,order_date
FROM Orders RIGHT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id; 
-- output:
/* # Customer_name, order_date
'Preethi', '2025-08-26'
'Chinchana', '2025-08-21'
'Deeksha', '2025-08-18'
'Mani', '2025-08-15'
'Mithun', '2025-08-10' */

SELECT Customer_name,order_date
FROM Orders LEFT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id
WHERE order_id IS NULL
UNION
SELECT Customer_name,order_date
FROM Orders RIGHT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id
WHERE Customers.Customer_id IS NULL;
-- output:
/* Customer_name, order_date */

SELECT product_name,City
FROM Orders LEFT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id
UNION
SELECT product_name,City
FROM Orders RIGHT OUTER JOIN Customers
ON Customers.customer_id = Orders.customer_id;
-- output:
/* # product_name, City
'Mobile', 'Bangalore'
'Laptop', 'Mumbai'
'StudyTable', 'Delhi'
'Clothes', 'Mysore'
'Watch', 'Coorg' */

  /* 5: Natural Join – 
          Find all orders placed by customers.
          List all customers with the products they ordered using NATURAL JOIN.
          Show customer names along with their order dates using NATURAL JOIN.
          Find all customer cities and the products ordered by those customers using NATURAL JOIN.

     Write your code below this line along with the output 
  */
  
SELECT order_id, product_name, customer_name
FROM Orders NATURAL JOIN Customers;
-- output:
/* # order_id, product_name, customer_name
'10', 'Mobile', 'Preethi'
'11', 'Laptop', 'Chinchana'
'12', 'StudyTable', 'Deeksha'
'13', 'Clothes', 'Mani'
'14', 'Watch', 'Mithun' */

SELECT product_name, customer_name
FROM Orders NATURAL JOIN Customers;
-- OUTPUT:
/* # product_name, customer_name
'Mobile', 'Preethi'
'Laptop', 'Chinchana'
'StudyTable', 'Deeksha'
'Clothes', 'Mani'
'Watch', 'Mithun' */

SELECT customer_name,order_date
FROM Orders NATURAL JOIN Customers;
-- output:
/* # customer_name, order_date
'Preethi', '2025-08-26'
'Chinchana', '2025-08-21'
'Deeksha', '2025-08-18'
'Mani', '2025-08-15'
'Mithun', '2025-08-10' */

SELECT City,product_name
FROM Orders NATURAL JOIN Customers;
-- output:
/* # City, product_name
'Bangalore', 'Mobile'
'Mumbai', 'Laptop'
'Delhi', 'StudyTable'
'Mysore', 'Clothes'
'Coorg', 'Watch' */

  -- END OF THE EXPERIMENT