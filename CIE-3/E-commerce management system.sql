CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    ProductID INT,
     FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    Quantity INT,
    OrderDate DATE
);


INSERT INTO Customers (CustomerID,CustomerName, Email, City)
VALUES
(101,'Ravi Kumar', 'ravi@gmail.com', 'Delhi'),
(102,'Priya Sharma', 'priya@gmail.com', 'Mumbai'),
(103,'Anil Mehta', 'anil@gmail.com', 'Bangalore');

INSERT INTO Products (ProductID,ProductName, UnitPrice, Stock)
VALUES
(201,'Smartphone', 15000.00, 50),
(202,'Laptop', 55000.00, 30),
(203,'Headphones', 1500.00, 100);

INSERT INTO Orders (OrderID,CustomerID, ProductID, Quantity, OrderDate)
VALUES
(301,101, 201, 2, '2025-10-20'),
(302,102, 202, 3, '2025-10-21'),
(303,103, 203, 1, '2025-10-22'),
(304,103, 201, 1, '2025-10-23'),
(305, 102, 202,3, '2025-10-24');

SELECT 
    O.OrderID,
    C.CustomerName,
    P.ProductName,
    O.Quantity,
    O.OrderDate
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Products P ON O.ProductID = P.ProductID;

SELECT 
    P.ProductName,
    SUM(O.Quantity * P.UnitPrice) AS TotalSales
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.ProductName;

SELECT 
    P.ProductName,
    SUM(O.Quantity) AS TotalQuantity
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalQuantity DESC
LIMIT 1;

SELECT * 
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 7 DAY;

DELIMITER //
CREATE PROCEDURE UpdateStock(
    IN p_id INT,
    IN qty INT
)
BEGIN
    UPDATE Products
    SET Stock = Stock - qty
    WHERE ProductID = p_id;
END //
DELIMITER ;

CALL UpdateStock(1, 2);
