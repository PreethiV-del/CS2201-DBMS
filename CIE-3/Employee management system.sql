CREATE DATABASE PayrollDB;
USE PayrollDB;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Gender CHAR(1),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
    HireDate DATE
);

CREATE TABLE SalaryDetails (
    SalaryID INT PRIMARY KEY,
    EmpID INT,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    BasicPay DECIMAL(10,2),
    Allowance DECIMAL(10,2),
    Deductions DECIMAL(10,2),
    NetSalary DECIMAL(10,2)
);

INSERT INTO Departments (DeptID,DeptName)VALUES 
(101, 'HR'),
(102,'Finance');

INSERT INTO Employees (EmpID,EmpName, Gender, DeptID, HireDate) VALUES
(201,'Ravi Kumar', 'M', 101, '2022-06-10'),
(202,'Priya Sharma', 'F', 102, '2023-01-05'),
(203,'Anil Mehta', 'M', 101, '2021-09-15'),
(204,'Sneha Reddy', 'F', 102, '2024-03-12');

INSERT INTO SalaryDetails (SalaryID,EmpID, BasicPay, Allowance, Deductions, NetSalary)
VALUES
(301,201, 40000, 5000, 2000, 43000),
(302,202, 55000, 7000, 3000, 59000),
(303,203, 60000, 8000, 2500, 65500),
(304,204, 35000, 4000, 1500, 37500);

SELECT E.EmpID,E.EmpName,D.DeptName,S.BasicPay,S.Allowance,S.Deductions,S.NetSalary
FROM Employees E
JOIN Departments D ON E.DeptID = D.DeptID
JOIN SalaryDetails S ON E.EmpID = S.EmpID;

SELECT D.DeptName,
SUM(S.NetSalary) AS TotalSalary,
AVG(S.NetSalary) AS AverageSalary
FROM Employees E
JOIN Departments D ON E.DeptID = D.DeptID
JOIN SalaryDetails S ON E.EmpID = S.EmpID
GROUP BY D.DeptName;

SELECT EmpName, HireDate
FROM Employees
WHERE HireDate >= CURDATE() - INTERVAL 1 YEAR;

DELIMITER //
CREATE PROCEDURE AddSalarys(IN sal_id INT,IN emp_id INT,IN basic DECIMAL(10,2),IN allow DECIMAL(10,2),IN deduc DECIMAL(10,2))
BEGIN
    DECLARE net DECIMAL(10,2);
    SET net = basic + allow - deduc;

    INSERT INTO SalaryDetails (SalaryID,EmpID, BasicPay, Allowance, Deductions, NetSalary)
    VALUES (sal_id,emp_id, basic, allow, deduc, net);
END //
DELIMITER ;

CALL AddSalarys(102,2, 50000, 6000, 2000,4000);

DELIMITER //
CREATE PROCEDURE UpdateSalary(
    IN emp_id INT,
    IN new_basic DECIMAL(10,2),
    IN new_allow DECIMAL(10,2),
    IN new_deduc DECIMAL(10,2)
)
BEGIN
    DECLARE new_net DECIMAL(10,2);
    SET new_net = new_basic + new_allow - new_deduc;

    UPDATE SalaryDetails
    SET BasicPay = new_basic,
        Allowance = new_allow,
        Deductions = new_deduc,
        NetSalary = new_net
    WHERE EmpID = emp_id;
END //
DELIMITER ;

CALL UpdateSalary(3, 62000, 9000, 2500);
