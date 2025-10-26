
-- Lab Experiment 08: Implementation of Procedure ( insert, update and delete)
-- STUDENT NAME: Preethi V
-- USN: 1RUA24BCA0071
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
# USER(), Host_Name, MySQL_Version, Current_Date_Time
/*'root@localhost', 'RVU-PC-014', '8.4.6', '2025-10-13 19:00:58'*/

-- Scenario: Employee Management System
-- CREATE AND LOAD THE database DBLab008
-- Write your SQL query below Codespace:
create database employeemanagment;
use employeemanagment;
-- Task 1: Create the Employee Table
create table employee
(empid int primary key,
 empname varchar(50),
 age INT,
 salary DECIMAL(10,2),
 designation VARCHAR(30),
 address VARCHAR(100),
 date_of_join DATE);
 desc employee;


-- Create a table to store information about Employee.
-- Include the following columns:
 --   empid INT PRIMARY KEY,
   -- empname VARCHAR(50),
   -- age INT,
   -- salary DECIMAL(10,2),
   -- designation VARCHAR(30),
   -- address VARCHAR(100),
   -- date_of_join DATE
-- Write your SQL query below Codespace:
 -- output:# Field, Type, Null, Key, Default, Extra
/*'empid', 'int', 'NO', 'PRI', NULL, ''
'empname', 'varchar(50)', 'YES', '', NULL, ''
'age', 'int', 'YES', '', NULL, ''
'salary', 'decimal(10,2)', 'YES', '', NULL, ''
'designation', 'varchar(30)', 'YES', '', NULL, ''
'address', 'varchar(100)', 'YES', '', NULL, ''
'date_of_join', 'date', 'YES', '', NULL, ''*/

-- DESCRIBE THE SCHEMA -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

-- insert 10 records to the table 
-- Write your SQL query below Codespace:
INSERT INTO employee(empid,empname,age,salary,designation,address,date_of_join) VALUES
(112, 'Priya', 34, 72000.00, 'Project Manager', 'Mumbai, Maharashtra', '2018-03-20'),
(113, 'Rahul', 26, 48000.00, 'QA Analyst', 'Pune, Maharashtra', '2021-01-10'),
(114, 'Sneha ', 31, 65000.00, 'Business Analyst', 'Delhi', '2019-07-25'),
(115, 'Vikram Singh', 28, 60000.00, 'DevOps Engineer', 'Hyderabad, Telangana', '2020-11-05'),
(116, 'Neha', 35, 80000.00, 'HR Manager', 'Chennai, Tamil Nadu', '2017-09-18'),
(117, 'Karan ', 30, 58000.00, 'UI/UX Designer', 'Ahmedabad, Gujarat', '2021-04-12'),
(118, 'Divya ', 27, 52000.00, 'Content Strategist', 'Kochi, Kerala', '2022-02-28'),
(119, 'Ravi', 33, 75000.00, 'Tech Lead', 'Nagpur, Maharashtra', '2019-12-01'),
(120, 'Meera Iyer', 25, 47000.00, 'Junior Developer', 'Bengaluru, Karnataka', '2023-05-10');
 select * from employee;



-- COPYPASTE OF THE OUTPUT in CSV Format and terminate with ;
# empid, empname, age, salary, designation, address, date_of_join
/*'101', 'Amit', '29', '55000.00', 'Software Engineer', 'Bengaluru, Karnataka', '2020-06-15'
'102', 'Priya', '34', '72000.00', 'Project Manager', 'Mumbai, Maharashtra', '2018-03-20'
'103', 'Rahul', '26', '48000.00', 'QA Analyst', 'Pune, Maharashtra', '2021-01-10'
'104', 'Sneha ', '31', '65000.00', 'Business Analyst', 'Delhi', '2019-07-25'
'105', 'Vikram Singh', '28', '60000.00', 'DevOps Engineer', 'Hyderabad, Telangana', '2020-11-05'
'106', 'Neha', '35', '80000.00', 'HR Manager', 'Chennai, Tamil Nadu', '2017-09-18'
'107', 'Karan ', '30', '58000.00', 'UI/UX Designer', 'Ahmedabad, Gujarat', '2021-04-12'
'108', 'Divya ', '27', '52000.00', 'Content Strategist', 'Kochi, Kerala', '2022-02-28'
'109', 'Ravi', '33', '75000.00', 'Tech Lead', 'Nagpur, Maharashtra', '2019-12-01'
'110', 'Meera Iyer', '25', '47000.00', 'Junior Developer', 'Bengaluru, Karnataka', '2023-05-10'
'111', 'Amit', '29', '55000.00', 'Software Engineer', 'Bengaluru, Karnataka', '2020-06-15'
'112', 'Priya', '34', '72000.00', 'Project Manager', 'Mumbai, Maharashtra', '2018-03-20'
'113', 'Rahul', '26', '48000.00', 'QA Analyst', 'Pune, Maharashtra', '2021-01-10'
'114', 'Sneha ', '31', '65000.00', 'Business Analyst', 'Delhi', '2019-07-25'
'115', 'Vikram Singh', '28', '60000.00', 'DevOps Engineer', 'Hyderabad, Telangana', '2020-11-05'
'116', 'Neha', '35', '80000.00', 'HR Manager', 'Chennai, Tamil Nadu', '2017-09-18'
'117', 'Karan ', '30', '58000.00', 'UI/UX Designer', 'Ahmedabad, Gujarat', '2021-04-12'
'118', 'Divya ', '27', '52000.00', 'Content Strategist', 'Kochi, Kerala', '2022-02-28'
'119', 'Ravi', '33', '75000.00', 'Tech Lead', 'Nagpur, Maharashtra', '2019-12-01'
'120', 'Meera Iyer', '25', '47000.00', 'Junior Developer', 'Bengaluru, Karnataka', '2023-05-10'*/
DESC EMPLOYEE;
-- perform the following procedures on the employee database and copy paste the output in the space provided
-- A. Insert Procedure
DELIMITER $$
CREATE PROCEDURE INSEMP213 (IN EMPID INT, IN EMPNAME VARCHAR(50), IN AGE INT, IN SALARY DECIMAL(10,2), IN DESIGNATION VARCHAR(30), IN ADDRESS VARCHAR(100), IN DATE_OF_JOIN DATE)
BEGIN
  INSERT INTO EMPLOYEE VALUES(EMPID,EMPNAME,AGE,SALARY,DESIGNATION,ADDRESS, DATE_OF_JOIN);
END $$

CALL insemp213 (22,'WOLF','23','25000','MANAGER','BANNERGATTA','2000-10-10');
SELECT * FROM EMPLOYEE;

/*# empid, empname, age, salary, designation, address, date_of_join
'101', 'Amit', '29', '55000.00', 'Software Engineer', 'Bengaluru, Karnataka', '2020-06-15'
'102', 'Priya', '34', '72000.00', 'Project Manager', 'Mumbai, Maharashtra', '2018-03-20'
'103', 'Rahul', '26', '48000.00', 'QA Analyst', 'Pune, Maharashtra', '2021-01-10'
'104', 'Sneha ', '31', '65000.00', 'Business Analyst', 'Delhi', '2019-07-25'
'105', 'Vikram Singh', '28', '60000.00', 'DevOps Engineer', 'Hyderabad, Telangana', '2020-11-05'
'106', 'Neha', '35', '80000.00', 'HR Manager', 'Chennai, Tamil Nadu', '2017-09-18'
'107', 'Karan ', '30', '58000.00', 'UI/UX Designer', 'Ahmedabad, Gujarat', '2021-04-12'
'108', 'Divya ', '27', '52000.00', 'Content Strategist', 'Kochi, Kerala', '2022-02-28'
'109', 'Ravi', '33', '75000.00', 'Tech Lead', 'Nagpur, Maharashtra', '2019-12-01'
'110', 'Meera Iyer', '25', '47000.00', 'Junior Developer', 'Bengaluru, Karnataka', '2023-05-10'
'111', 'Amit', '29', '55000.00', 'Software Engineer', 'Bengaluru, Karnataka', '2020-06-15'
'112', 'Priya', '34', '72000.00', 'Project Manager', 'Mumbai, Maharashtra', '2018-03-20'
'113', 'Rahul', '26', '48000.00', 'QA Analyst', 'Pune, Maharashtra', '2021-01-10'
'114', 'Sneha ', '31', '65000.00', 'Business Analyst', 'Delhi', '2019-07-25'
'115', 'Vikram Singh', '28', '60000.00', 'DevOps Engineer', 'Hyderabad, Telangana', '2020-11-05'
'116', 'Neha', '35', '80000.00', 'HR Manager', 'Chennai, Tamil Nadu', '2017-09-18'
'117', 'Karan ', '30', '58000.00', 'UI/UX Designer', 'Ahmedabad, Gujarat', '2021-04-12'
'118', 'Divya ', '27', '52000.00', 'Content Strategist', 'Kochi, Kerala', '2022-02-28'
'119', 'Ravi', '33', '75000.00', 'Tech Lead', 'Nagpur, Maharashtra', '2019-12-01'
'120', 'Meera Iyer', '25', '47000.00', 'Junior Developer', 'Bengaluru, Karnataka', '2023-05-10'
'201', 'WOLF', '23', '25000.00', 'MANAGER', 'BANNERGATTA', '2000-10-10'
'222', 'WOLF', '23', '25000.00', 'MANAGER', 'BANNERGATTA', '2000-10-10'*/


-- 1. Write a stored procedure named InsertEmployee to insert a new employee record into the Employee table with all fields as input parameters.
-- 2. Modify the insert procedure to ensure the employee’s age must be between 18 and 60.
      -- If not, display a message: "Invalid age, employee not added."
DELIMITER $$

CREATE PROCEDURE INSEMP1231(
  IN EMPID INT,
  IN EMPNAME VARCHAR(50),
  IN AGE INT,
  IN SALARY DECIMAL(10,2),
  IN DESIGNATION VARCHAR(30),
  IN ADDRESS VARCHAR(100),
  IN DATE_OF_JOIN DATE
)
BEGIN
  -- Check if age is valid
  IF AGE >= 18 AND AGE <= 60 THEN
    INSERT INTO EMPLOYEE 
    VALUES (EMPID, EMPNAME, AGE, SALARY, DESIGNATION, ADDRESS, DATE_OF_JOIN);
  ELSE
    SELECT 'Invalid age, employee not added.' AS Message;
  END IF;
END $$

DELIMITER ;
select * from employee;
-- output:# empid, empname, age, salary, designation, address, date_of_join
/*'22', 'WOLF', '23', '25000.00', 'MANAGER', 'BANNERGATTA', '2000-10-10'
'112', 'Priya', '34', '72000.00', 'Project Manager', 'Mumbai, Maharashtra', '2018-03-20'
'113', 'Rahul', '26', '48000.00', 'QA Analyst', 'Pune, Maharashtra', '2021-01-10'
'114', 'Sneha ', '31', '65000.00', 'Business Analyst', 'Delhi', '2019-07-25'
'115', 'Vikram Singh', '28', '60000.00', 'DevOps Engineer', 'Hyderabad, Telangana', '2020-11-05'
'116', 'Neha', '35', '80000.00', 'HR Manager', 'Chennai, Tamil Nadu', '2017-09-18'
'117', 'Karan ', '30', '58000.00', 'UI/UX Designer', 'Ahmedabad, Gujarat', '2021-04-12'
'118', 'Divya ', '27', '52000.00', 'Content Strategist', 'Kochi, Kerala', '2022-02-28'
'119', 'Ravi', '33', '75000.00', 'Tech Lead', 'Nagpur, Maharashtra', '2019-12-01'
'120', 'Meera Iyer', '25', '47000.00', 'Junior Developer', 'Bengaluru, Karnataka', '2023-05-10'*/


-- 3. Create a procedure that inserts a new employee record.
          -- If the salary is not provided, assign a default salary of 20000.
          DELIMITER $$

CREATE PROCEDURE INSEMP_DEFAULT_SAL (
  IN EMPID INT,
  IN EMPNAME VARCHAR(50),
  IN AGE INT,
  IN SALARY DECIMAL(10,2),
  IN DESIGNATION VARCHAR(30),
  IN ADDRESS VARCHAR(100),
  IN DATE_OF_JOIN DATE
)
BEGIN
  
  IF SALARY IS NULL OR SALARY = 0 THEN
    SET SALARY = 20000;
  END IF;


  INSERT INTO EMPLOYEE 
  VALUES (EMPID, EMPNAME, AGE, SALARY, DESIGNATION, ADDRESS, DATE_OF_JOIN);
DELIMITER ;
-- output:# empid, empname, age, salary, designation, address, date_of_join
/*'22', 'WOLF', '23', '25000.00', 'MANAGER', 'BANNERGATTA', '2000-10-10'
'112', 'Priya', '34', '72000.00', 'Project Manager', 'Mumbai, Maharashtra', '2018-03-20'
'113', 'Rahul', '26', '48000.00', 'QA Analyst', 'Pune, Maharashtra', '2021-01-10'
'114', 'Sneha ', '31', '65000.00', 'Business Analyst', 'Delhi', '2019-07-25'
'115', 'Vikram Singh', '28', '60000.00', 'DevOps Engineer', 'Hyderabad, Telangana', '2020-11-05'
'116', 'Neha', '35', '80000.00', 'HR Manager', 'Chennai, Tamil Nadu', '2017-09-18'
'117', 'Karan ', '30', '58000.00', 'UI/UX Designer', 'Ahmedabad, Gujarat', '2021-04-12'
'118', 'Divya ', '27', '52000.00', 'Content Strategist', 'Kochi, Kerala', '2022-02-28'
'119', 'Ravi', '33', '75000.00', 'Tech Lead', 'Nagpur, Maharashtra', '2019-12-01'
'120', 'Meera Iyer', '25', '47000.00', 'Junior Developer', 'Bengaluru, Karnataka', '2023-05-10'*/


-- 4. Write a procedure that inserts three new employee records in a single procedure using multiple INSERT statements.
DELIMITER $$

CREATE PROCEDURE INSEMP_MULTIPLE()
BEGIN
  INSERT INTO EMPLOYEE 
  VALUES (501, 'Aarav', 28, 40000.00, 'Developer', 'Bengaluru', '2022-05-12');

  INSERT INTO EMPLOYEE 
  VALUES (502, 'Diya', 30, 55000.00, 'Project Manager', 'Mumbai', '2021-07-23');

  INSERT INTO EMPLOYEE 
  VALUES (503, 'Karthik', 26, 38000.00, 'Tester', 'Hyderabad', '2023-01-19');

DELIMITER ;

-- B.  Update Procedure
/*
Update Salary:
Write a stored procedure named UpdateSalary to update an employee’s salary based on their empid.
*/
DELIMITER $$

CREATE PROCEDURE UpdateSalary(
  IN empid INT,
  IN newsalary DECIMAL(10,2)
)
BEGIN
  UPDATE EMPLOYEE
  SET salary = newsalary
  WHERE EMPID = empid;
END $$

DELIMITER ;
/*
Increment Salary by Percentage:
Create a procedure to increase the salary by 10% for all employees whose designation = 'Manager'.
*/
DELIMITER $$

CREATE PROCEDURE IncrementSalary()
BEGIN
  UPDATE EMPLOYEE
  SET salary = salary + (salary * 0.10)
  WHERE designation = 'Manager';
END $$

DELIMITER ;
/*
Update Designation:
Write a procedure to update the designation of an employee by empid.
Example: Promote an employee from 'Clerk' to 'Senior Clerk'.
*/
DELIMITER $$

CREATE PROCEDURE UpdateDesignation(
  IN empid INT,
  IN new_designation VARCHAR(30)
)
BEGIN
  UPDATE EMPLOYEE
  SET designation = new_designation
  WHERE EMPID = empid;
END $$

DELIMITER ;

/*
Update Address:
Write a procedure to update the address of an employee when empid is given as input.*/
DELIMITER $$

CREATE PROCEDURE UpdateAddress(
  IN empid INT,
  IN new_address VARCHAR(100)
)
BEGIN
  UPDATE EMPLOYEE
  SET address = new_address
  WHERE EMPID = empid;
END $$

DELIMITER ;

/*
Conditional Update (Age Check):
Create a procedure that updates salary only if the employee’s age > 40; otherwise, print "Not eligible for salary update."
*/
DELIMITER $$

CREATE PROCEDURE ConditionalSalaryUpdate(
  IN empid INT,
  IN new_salary DECIMAL(10,2)
)
BEGIN
  IF (SELECT age FROM EMPLOYEE WHERE empid = empid) > 40 THEN
    UPDATE EMPLOYEE
    SET salary = new_salary
    WHERE empid = empid;
  ELSE
    SELECT 'Not eligible for salary update.' AS Message;
  END IF;
END $$

DELIMITER ;


-- C. Delete Procedure
/*
Delete by empid:
Write a stored procedure named DeleteEmployee to delete an employee record using their empid.*/
DELIMITER $$

CREATE PROCEDURE DeleteEmployee(
  IN empid INT
)
BEGIN
  DELETE FROM EMPLOYEE
  WHERE EMPID = empid;
END $$

DELIMITER ;

/*
Delete by Designation:
Create a procedure that deletes all employees belonging to a specific designation (e.g., 'Intern').*/

DELIMITER $$

CREATE PROCEDURE DeleteByDesignation(
  IN desig VARCHAR(30)
)
BEGIN
  DELETE FROM EMPLOYEE
  WHERE designation = desig;
END $$

DELIMITER ;
/*
Delete Based on Salary Range:
Write a procedure to delete employees whose salary is less than ₹15000.*/
DELIMITER $$

CREATE PROCEDURE DeleteLowSalaryEmployees()
BEGIN
  DELETE FROM EMPLOYEE
  WHERE salary < 15000;
END $$

DELIMITER ;

/*
Delete by Joining Year:
Write a procedure to delete employees who joined before the year 2015.
*/
DELIMITER $$

CREATE PROCEDURE DeleteByJoiningYear()
BEGIN
  DELETE FROM EMPLOYEE
  WHERE YEAR(date_of_join) < 2015;
END $$

DELIMITER ;

-- End of Lab Experiment 
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
