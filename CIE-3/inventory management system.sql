CREATE DATABASE InventoryDB;
USE InventoryDB;

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50),
    ContactNo VARCHAR(15),
    City VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    Stock INT
);

CREATE TABLE SupplyOrders (
    OrderID INT PRIMARY KEY,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    Quantity INT,
    OrderDate DATE);

INSERT INTO Suppliers (SupplierID,SupplierName, ContactNo, City)VALUES
(101,'ABC Traders', '9876543210', 'Delhi'),
(102,'Global Supply Co.', '9876501234', 'Mumbai'),
(103,'FreshMart Pvt Ltd', '9876512345', 'Bangalore');

INSERT INTO Products (ProductID,ProductName, UnitPrice, Stock) VALUES
(201,'Rice Bag', 1200.00, 50),
(202,'Sugar Packet', 45.00, 200),
(203,'Cooking Oil (1L)', 160.00, 100);

INSERT INTO SupplyOrders (OrderID,SupplierID, ProductID, Quantity, OrderDate) VALUES
(301,101, 201, 20, '2025-10-20'),
(302, 102, 202,30, '2025-10-21'),
(303, 103, 203,40, '2025-10-22');

SELECT O.OrderID,S.SupplierName,P.ProductName,O.Quantity,O.OrderDate
FROM SupplyOrders O
JOIN Suppliers S ON O.SupplierID = S.SupplierID
JOIN Products P ON O.ProductID = P.ProductID;

SELECT S.SupplierName,
SUM(O.Quantity) AS TotalQuantitySupplied
FROM SupplyOrders O
JOIN Suppliers S ON O.SupplierID = S.SupplierID
GROUP BY S.SupplierName;

SELECT O.OrderID,S.SupplierName,O.Quantity,O.OrderDate
FROM SupplyOrders O
JOIN Suppliers S ON O.SupplierID = S.SupplierID
WHERE O.OrderDate >= CURDATE() - INTERVAL 7 DAY;

SELECT MONTHNAME(OrderDate) AS Month, SUM(Quantity) AS TotalQuantity
FROM SupplyOrders
GROUP BY MONTH(OrderDate);

DELIMITER //
CREATE PROCEDURE AddSupplyOrders(IN sup_id INT,IN prod_id INT,IN qty INT,IN ord_date DATE)
BEGIN
    INSERT INTO SupplyOrders (OrderID,SupplierID, ProductID, Quantity, OrderDate)
    VALUES (sup_id, prod_id, qty, ord_date);
END //
DELIMITER ;

CALL AddSupplyOrders(1, 3,5, 25, '2025-10-27');

DELIMITER //
CREATE PROCEDURE UpdateSupplyOrder(IN ord_id INT,IN new_qty INT)
BEGIN
    UPDATE SupplyOrders
    SET Quantity = new_qty
    WHERE OrderID = ord_id;
END //
DELIMITER ;

CALL UpdateSupplyOrder(2, 60);