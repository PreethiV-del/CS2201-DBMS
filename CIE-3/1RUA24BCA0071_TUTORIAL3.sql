CREATE DATABASE SCHOOL;
USE SCHOOL;

CREATE TABLE STUDENTS
( StudentID int PRIMARY KEY,
  FirstName char(15),
  LastName char(2),
  DateOfBirth date,
  Class varchar(4),
  Marks int,
  City char(10));
  DESC STUDENTS;
  
ALTER TABLE STUDENTS
MODIFY Class varchar(4);
  
CREATE TABLE TEACHER
( TeacherID int PRIMARY KEY,
  FirstName char(15),
  LastName char(2),
  Subject char(8),
  HireDate date,
  Salary float);
  DESC TEACHER;
  
CREATE TABLE COURSES
( CourseID int PRIMARY KEY,
  CourseName char(15),
  Credits int);
  DESC COURSES;
  
ALTER TABLE COURSES
MODIFY CourseName char(30);
  
CREATE TABLE ENROLLMENT
( EnrollID int PRIMARY KEY,
  StudentID int,
  FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
  CourseID int,
  FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID),
  Grade char(1));
  DESC ENROLLMENT;
  
-- Display the details  of all students.
INSERT INTO STUDENTS (StudentID, FirstName, LastName, DateOfBirth, Class, Marks, City) VALUES 
  (1, 'Chinchana', 'K', '2008-05-14', '10A', 88, 'Delhi'),
  (2, 'Mithun', 'V', '2009-11-22', '9B', 92, 'Mumbai'),
  (3, 'Deeksha', 'S', '2007-03-30', '11C', 76, 'Bengaluru'),
  (4, 'Meena', 'V', '2008-08-19', '10B', 81, 'Delhi'),
  (5, 'Venkatesh', 'KV', '2009-01-05', '9A', 67, 'Chennai');
  
SELECT * FROM STUDENTS;

INSERT INTO TEACHER (TeacherID, FirstName, LastName, Subject , HireDate, Salary)
VALUES
  (1, 'Anjali', 'R', 'Maths', '2015-06-12', 55000.00),
  (2, 'Ramesh', 'K', 'Physics', '2016-08-20', 60000.00),
  (3, 'Sneha', 'S', 'Biology', '2018-01-10', 58000.00),
  (4, 'Vikram', 'T', 'English', '2014-11-05', 62000.00),
  (5, 'Meera', 'N', 'Maths', '2017-03-25', 57000.00);
SELECT * FROM TEACHER;

INSERT INTO COURSES (CourseID, CourseName, Credits)
VALUES
  (1, 'Maths', 4),
  (2, 'Physics', 3),
  (3, 'Biology', 4),
  (4, 'English', 2),
  (5, 'Chemistry', 3);
  SELECT * FROM COURSES;

-- Show the  last 3 characters of course names.
SELECT SUBSTR(CourseName, LENGTH(CourseName) - 2,3) from COURSE;

-- OUTPUT:
/*# SUBSTR(CourseName, LENGTH(CourseName) - 2,3)
'ths'
'ics'
'ogy'
'ish'
'try' */

-- Concatenate FirstName and LastName of teachers as fullname:
SELECT CONCAT(FirstName,LastName) AS FULLNAME FROM TEACHER;

-- OUTPUT:
/*# FULLNAME
'AnjaliR'
'RameshK'
'SnehaS'
'VikramT'
'MeeraN'*/

-- Find the length of each student’s name
SELECT LENGTH(FirstName) FROM STUDENTS;

-- OUTPUT:
/*# LENGTH(FirstName)
'9'
'6'
'7'
'5'
'9'*/

-- Replace the word "Maths" with "Mathematics" in the Course table. (use REPLACE function)
UPDATE COURSES SET CourseName = REPLACE(CourseName, 'Maths', 'Mathematics');
SELECT * FROM COURSES;

-- OUTPUT:
/*# CourseID, CourseName, Credits
'1', 'Mathematics', '4'
'2', 'Physics', '3'
'3', 'Biology', '4'
'4', 'English', '2'
'5', 'Chemistry', '3' */


-- Find the absolute difference between maximum and minimum marks.
SELECT ABS(MAX(Marks) - MIN(Marks)) AS ABSOLUTEDIFFERENCE FROM STUDENTS;

-- OUTPUT:
/*# ABSOLUTEDIFFERENCE
'25' */

-- Round off teachers’ salaries to the nearest thousand.
SELECT ROUND(Salary, -3) AS ROUNDEDSALARY FROM TEACHER; 

-- OUTPUT:
/*# ROUNDEDSALARY
'55000'
'60000'
'58000'
'62000'
'57000' */

-- Show the square root of each course credit.
SELECT SQRT(Credits) AS CREDITSQUARE FROM COURSE;

-- OUTPUT:
/*# CREDITSQUARE
'2'
'1.7320508075688772'
'2'
'1.4142135623730951'
'1.7320508075688772' */

-- Display students’ marks along with ceiling and floor values.
SELECT CEIL(Marks) AS CEILINGMARKS, FLOOR(Marks) AS FLOORMARKS FROM STUDENTS;

-- OUTPUT:
/*# CEILINGMARKS, FLOORMARKS
'88',            '88'
'92',            '92'
'76',            '76'
'81',            '81'
'67',            '67' */

-- Find the modulus of total marks divided by 5.
SELECT MOD(SUM(Marks), 5) AS MODTOTALMARKS FROM STUDENTS;

-- OUTPUT:
/*# MODTOTALMARKS
'4' */

-- Display the current date and time.
SELECT NOW();

-- OUTPUT:
/*# NOW()
'2025-09-10 20:21:16' */

-- Show the year and month of hire for all teachers.
SELECT YEAR(HireDate) AS HIREYEAR, MONTH(HireDate) AS HIREMONTH FROM TEACHER;

-- OUTPUT:
/*# HIREYEAR, HIREMONTH
2015,           '6'
2016,           '8'
2018,           '1'
2014,           '11'
2017,           '3' */

-- List students who were born in January. 
SELECT MONTH(DateOfBirth = 01) AS JANUARY FROM STUDENTS;

-- OUTPUT:
/* # JANUARY
'0'
'0'
'0'
'0'
'0'*/

-- Find the difference in days between today and a teacher’s HireDate. 
SELECT DATEDIFF('2025-09-10' , HireDate) AS DATEDIFFERENCE FROM TEACHER;

-- OUTPUT:
/*# DATEDIFFERENCE
'3743'
'3308'
'2800'
'3962'
'3091' */

-- Find the total number of students in the school.
SELECT COUNT(*) AS TOTALSTUDENTS FROM STUDENTS;

-- OUTPUT:
/*# TOTALSTUDENTS
'5' */

-- Calculate the average salary of teachers.
SELECT AVG(Salary) AS AVGSALARY FROM TEACHER;

-- OUTPUT:
/* # AVGSALARY
'58400' */

-- Find the highest and lowest marks in the Student table.
SELECT MAX(Marks) AND MIN(Marks) AS HIGHLOWMARKS FROM STUDENTS;

-- OUTPUT:
/* # HIGHLOWMARKS
'1' */