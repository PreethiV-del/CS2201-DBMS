create database employeeemanagement;
use employeeemanagement;

create table departments
(dep_id int PRIMARY KEY,
dep_name varchar(40),
location varchar(50));

create table employee
(emp_id int PRIMARY KEY ,
emp_name char(30),
age int,
salary char(30),
designation char(40),
address varchar(50),
doj date,
dep_id int ,
foreign key(dep_id) references DEPARTMENT(dep_id));
desc employeee;

INSERT INTO departments (dep_id, dep_name, location)VALUES
(1, 'Human Resources', 'New York'),
(2, 'Finance', 'Chicago'),
(3, 'IT', 'San Francisco'),
(4, 'Marketing', 'Los Angeles'),
(5, 'Operations', 'Houston'),
(6, 'Developer', 'India');

select * from departments;

INSERT INTO employee (emp_id, emp_name, age, salary, designation, address, doj, dep_id)VALUES
(101, 'John Smith', 30, 60000.00, 'HR Executive', 'New York', '2020-05-10', 1),
(102, 'Emma Davis', 28, 75000.00, 'Accountant', 'Chicago', '2021-03-15', 2),
(103, 'Liam Johnson', 32, 90000.00, 'Software Developer', 'San Francisco', '2019-08-25', 3),
(104, 'Olivia Brown', 27, 65000.00, 'Marketing Specialist', 'Los Angeles', '2022-02-11', 4),
(105, 'Noah Wilson', 35, 70000.00, 'Operations Manager', 'Houston', '2018-07-30', 5);
select * from employee;

SELECT designation, salary FROM employee WHERE designation = 'Developer';

SELECT dep_id,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employee GROUP BY dep_id;

-- OUTPUT:
/* # dep_id, total_employees, average_salary, highest_salary, lowest_salary
'1', '1', '60000', '60000.00', '60000.00'
'2', '1', '75000', '75000.00', '75000.00'
'3', '1', '90000', '90000.00', '90000.00'
'4', '1', '65000', '65000.00', '65000.00'
'5', '1', '70000', '70000.00', '70000.00' */

SELECT UPPER(emp_name) AS Employee_Name,
	   UPPER(designation) AS Designation,
       CONCAT(emp_name, ' works as ', designation) AS Employee_Description
FROM employee;

-- OUTPUT:
/* # Employee_Name, Designation, Employee_Description
'JOHN SMITH', 'HR EXECUTIVE', 'John Smith works as HR Executive'
'EMMA DAVIS', 'ACCOUNTANT', 'Emma Davis works as Accountant'
'LIAM JOHNSON', 'SOFTWARE DEVELOPER', 'Liam Johnson works as Software Developer'
'OLIVIA BROWN', 'MARKETING SPECIALIST', 'Olivia Brown works as Marketing Specialist'
'NOAH WILSON', 'OPERATIONS MANAGER', 'Noah Wilson works as Operations Manager' */

SELECT emp_name,
YEAR(doj) AS joining_year,
YEAR(CURDATE()) - YEAR(doj) AS years_worked
FROM Employee;

-- OUTPUT:
/* # emp_name, joining_year, years_worked
'John Smith', 2020, '5'
'Emma Davis', 2021, '4'
'Liam Johnson', 2019, '6'
'Olivia Brown', 2022, '3'
'Noah Wilson', 2018, '7' */

SELECT emp_name, salary FROM Employee WHERE salary BETWEEN 40000 AND 80000 AND dep_id != 'Sales';

-- OUTPUT:
/* # emp_name, salary
'Emma Davis', '75000.00'
'Olivia Brown', '65000.00'
'Noah Wilson', '70000.00' */

SELECT Employee.emp_name, Departments.dep_name
FROM Employee
RIGHT OUTER JOIN Departments
ON Employee.dep_id = Departments.dep_id;

-- OUTPUT:
/* # emp_name, dep_name
'John Smith', 'Human Resources'
'Emma Davis', 'Finance'
'Liam Johnson', 'IT'
'Olivia Brown', 'Marketing'
'Noah Wilson', 'Operations'
NULL, 'Developer' */

SELECT Employee.emp_name, Departments.dep_name
FROM Employee
LEFT OUTER JOIN Departments
ON Employee.dep_id = Departments.dep_id;

-- OUTPUT:
/* # emp_name, dep_name
'John Smith', 'Human Resources'
'Emma Davis', 'Finance'
'Liam Johnson', 'IT'
'Olivia Brown', 'Marketing'
'Noah Wilson', 'Operations' */

SELECT Employee.emp_name, Employee.designation, Departments.dep_name, Departments.location
FROM Employee
INNER JOIN Departments ON Employee.dep_id = Departments.dep_id
-- OUTPUT:
/* # emp_name, designation, dep_name, location
'John Smith', 'HR Executive', 'Human Resources', 'New York'
'Emma Davis', 'Accountant', 'Finance', 'Chicago'
'Liam Johnson', 'Software Developer', 'IT', 'San Francisco'
'Olivia Brown', 'Marketing Specialist', 'Marketing', 'Los Angeles'
'Noah Wilson', 'Operations Manager', 'Operations', 'Houston' */

DELIMITER $$
CREATE PROCEDURE InsEmployeee(
    IN emp_id INT,
    IN emp_name VARCHAR(50),
    IN age INT,
    IN salary DECIMAL(10,2),
    IN designation VARCHAR(30),
    IN address VARCHAR(100),
    IN doj DATE,
    IN dep_name INT
)
BEGIN
    INSERT INTO Employee VALUES (emp_id, emp_name,age,salary,designation,address,doj, dep_name);
    CALL InsEmployeee (101,'Alice Johnson',30,55000.00,'Software Engineer','123 Maple Street','2022-06-01',1);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE UpdateSalary(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employee SET salary = new_salary WHERE emp_id = eid;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteEmployee(
    IN emp_id INT
)
BEGIN
    DELETE FROM Employee WHERE emp_id = eid;
END $$
DELIMITER ;

SELECT
    e.emp_name AS employee_name,
    d.dep_name AS department_name,
    TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) AS years_worked,
    (e.salary + CASE WHEN e.designation = 'Developer' THEN 5000 ELSE 0 END) AS salary_after_increment
FROM Employee e
LEFT JOIN Department d ON e.dep_id = d.dep_id
WHERE TIMESTAMPDIFF(YEAR, e.doj, CURDATE()) > 2
ORDER BY years_worked DESC, e.emp_name;


