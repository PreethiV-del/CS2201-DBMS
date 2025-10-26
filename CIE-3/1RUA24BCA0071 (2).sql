-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: PREETHI V
-- USN: 1RUA24BCA0071
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command

/*# USER(), Host_Name, MySQL_Version, Current_Date_Time
'root@localhost', 'RVU-PC-014', '8.4.6', '2025-09-08 06:00:00' */

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE EMPLOYEEDETAILS;
USE EMPLOYEEDETAILS;

-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
CREATE TABLE EMPLOYEES
( Emp_ID int PRIMARY KEY,
  FirstName char(20),
  LastName char(3),
  Salary int,
  BirthDate date,
  HireDate date);
DESC EMPLOYEES;

-- 2. Insert 10 records to employee;
INSERT INTO EMPLOYEES (Emp_ID, FirstName, LastName, Salary, BirthDate, HireDate) VALUES
(1,'Chinchana','K',150000,'2007-02-22','2025-08-09'),
(2,'Deeksha','S',250000,'2007-02-19','2025-07-09'),
(3,'Preethi','V',350000,'2006-06-03','2025-06-09'),
(4,'Mani','C',450000,'2002-04-11','2023-06-07'),
(5,'Mithun','V',550000,'2011-08-29','2026-05-04'),
(6,'Sneha','R',180000,'2008-03-15','2025-09-12'),
(7,'Arjun','M',270000,'2009-11-27','2026-01-18'),
(8,'Lavanya','T',320000,'2005-07-09','2025-10-05'),
(9,'Rakesh','B',430000,'2003-12-21','2024-12-30'),
(10,'Nisha','L',510000,'2010-05-06','2026-03-22');
DESC EMPLOYEES;


-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key) 
CREATE TABLE ORDERSSS
( OrderID int PRIMARY KEY,
  OrderDate date,
  TotalAmount int,
  Emp_ID int,
  FOREIGN KEY (Emp_ID) REFERENCES EMPLOYEES(Emp_ID)
);
DESC ORDERSS;

-- 4. Insert 10 records to Orders
INSERT INTO ORDERSSS(OrderID, OrderDate, TotalAmount, Emp_ID) VALUES
(1001, '2025-09-01', 150000, 1),
(1002, '2025-09-02', 230050, 2),
(1003, '2025-09-03', 180075, 3),
(1004, '2025-09-04', 275000, 4),
(1005, '2025-09-05', 320025, 5),
(1006, '2025-09-06', 195000, 6),
(1007, '2025-09-07', 210010, 7),
(1008, '2025-09-08', 305000, 8),
(1009, '2025-09-08', 16560, 9),
(1010, '2025-09-08', 285090, 10);
DESC ORDERS;  
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]

-- Write the SQL Query below this line.
SELECT * FROM EMPLOYEES;
SELECT * FROM ORDERSSS;

-- Output: 
/* # Emp_ID, FirstName, LastName, Salary, BirthDate, HireDate
'1', 'Chinchana', 'K', '150000', '2007-02-22', '2025-08-09'
'2', 'Deeksha', 'S', '250000', '2007-02-19', '2025-07-09'
'3', 'Preethi', 'V', '350000', '2006-06-03', '2025-06-09'
'4', 'Mani', 'C', '450000', '2002-04-11', '2023-06-07'
'5', 'Mithun', 'V', '550000', '2011-08-29', '2026-05-04'
'6', 'Sneha', 'R', '180000', '2008-03-15', '2025-09-12'
'7', 'Arjun', 'M', '270000', '2009-11-27', '2026-01-18'
'8', 'Lavanya', 'T', '320000', '2005-07-09', '2025-10-05'
'9', 'Rakesh', 'B', '430000', '2003-12-21', '2024-12-30'
'10', 'Nisha', 'L', '510000', '2010-05-06', '2026-03-22' */


/* # OrderID, OrderDate, TotalAmount, Emp_ID
'1001', '2025-09-01', '150000', '1'
'1002', '2025-09-02', '230050', '2'
'1003', '2025-09-03', '180075', '3'
'1004', '2025-09-04', '275000', '4'
'1005', '2025-09-05', '320025', '5'
'1006', '2025-09-06', '195000', '6'
'1007', '2025-09-07', '210010', '7'
'1008', '2025-09-08', '305000', '8'
'1009', '2025-09-08', '16560', '9'
'1010', '2025-09-08', '285090', '10' */


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
SELECT ROUND(Salary) AS ROUNDEDSALARY from EMPLOYEES;

-- Output: 
/*# ROUNDEDSALARY
'150000'
'250000'
'350000'
'450000'
'550000'
'180000'
'270000'
'320000'
'430000'
'510000' */

/* b. Absolute Values: Show absolute values of salaries */
SELECT ABS(Salary) AS ABSOLUTESALARY from EMPLOYEES;
-- Output: 
/*# ABSOLUTESALARY
'150000'
'250000'
'350000'
'450000'
'550000'
'180000'
'270000'
'320000'
'430000'
'510000'*/

/* c. Ceiling Values: Get ceiling values of order amounts */
SELECT CEIL(TotalAmount) AS CEILINGAMOUNTS from ORDERSSS;
-- Output: 
/*# CEILINGAMOUNTS
'150000'
'230050'
'180075'
'275000'
'320025'
'195000'
'210010'
'305000'
'16560'
'285090'*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT COUNT(*) AS TOTALEMPLOYEES from EMPLOYEES;
-- Output: 
/*# TOTALEMPLOYEES
'10'*/

/* b. Sum of Salaries: Calculate total salary expense */
SELECT SUM(Salary) AS SALARYEXPENSE from EMPLOYEES;
-- Output: 
/*# SALARYEXPENSE
'3460000'*/

/* c. Average Order Amount: Find average order value */
SELECT AVG(TotalAmount) AS AVGORDERVALUE from ORDERSSS;
-- Output: 
/*# AVGORDERVALUE
'216681.0000'*/

/* d. Max/Min Salary: Find highest and lowest salaries */
SELECT MAX(SALARY) AND MIN(SALARY) AS HIGHLLOWSALARY from EMPLOYEES;
-- Output: 
/*# HIGHLLOWSALARY
'1'*/

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT FirstName,LastName, upper(FirstName) AS UPPERFIRSTNAME, lower(LastName) AS LOWERLASTNAME from EMPLOYEES;
-- Output: 
/*# FirstName, LastName, UPPERFIRSTNAME, LOWERLASTNAME
'Chinchana', 'K', 'CHINCHANA', 'k'
'Deeksha', 'S', 'DEEKSHA', 's'
'Preethi', 'V', 'PREETHI', 'v'
'Mani', 'C', 'MANI', 'c'
'Mithun', 'V', 'MITHUN', 'v'
'Sneha', 'R', 'SNEHA', 'r'
'Arjun', 'M', 'ARJUN', 'm'
'Lavanya', 'T', 'LAVANYA', 't'
'Rakesh', 'B', 'RAKESH', 'b'
'Nisha', 'L', 'NISHA', 'l'*/

/* b. Concatenate Names: Create full names */
SELECT CONCAT(FirstName,LastName) AS FULLNAME FROM EMPLOYEES;
-- Output: 
/*# FULLNAME
'ChinchanaK'
'DeekshaS'
'PreethiV'
'ManiC'
'MithunV'
'SnehaR'
'ArjunM'
'LavanyaT'
'RakeshB'
'NishaL'*/

/* c. Extract Substring: Get first 3 characters of first names */
SELECT SUBSTR(FirstName,1,3) from EMPLOYEES;
-- Output: 
/*# SUBSTR(FirstName,1,3)
'Chi'
'Dee'
'Pre'
'Man'
'Mit'
'Sne'
'Arj'
'Lav'
'Rak'
'Nis'*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
SELECT CAST(OrderDate AS CHAR) AS CONVERTEDDATE FROM ORDERSSS;
-- Output: 
/*# CONVERTEDDATE
'2025-09-01'
'2025-09-02'
'2025-09-03'
'2025-09-04'
'2025-09-05'
'2025-09-06'
'2025-09-07'
'2025-09-08'
'2025-09-08'
'2025-09-08'*/

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
SELECT NOW();
-- Output: 
/*# NOW()
'2025-09-08 07:31:05'*/

/* b. Extract Year: Get year from order dates */
SELECT EXTRACT(YEAR FROM OrderDate) AS ORDERYEAR FROM ORDERSSS;
-- Output: 
/*# ORDERYEAR
'2025'
'2025'
'2025'
'2025'
'2025'
'2025'
'2025'
'2025'
'2025'
'2025'*/

/* c. Add Months: Add 3 months to order dates */
select date_add(OrderDate, INTERVAL 3 MONTH) AS FINALDATE FROM ORDERSSS;
-- Output: 
/*# FINALDATE
'2025-12-01'
'2025-12-02'
'2025-12-03'
'2025-12-04'
'2025-12-05'
'2025-12-06'
'2025-12-07'
'2025-12-08'
'2025-12-08'
'2025-12-08'*/

/* d. Days Since Order: Calculate days between order date and now */
SELECT OrderID, datediff(OrderDate, NOW()) AS DAYSSINCEORDER FROM ORDERSSS;
-- Output: 
/*# OrderID, DAYSSINCEORDER
'1001', '-7'
'1002', '-6'
'1003', '-5'
'1004', '-4'
'1005', '-3'
'1006', '-2'
'1007', '-1'
'1008', '0'
'1009', '0'
'1010', '0'*/

-- END of the Task -- 