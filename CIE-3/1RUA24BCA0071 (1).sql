-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: Preethi V
-- USN: 1RUA24BCA0071
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
CREATE DATABASE COLLEGEMANAGEMENT;
USE COLLEGEMANAGEMENT;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  CREATE TABLE DEPARTMENTS
  ( DepartmentID int PRIMARY KEY,
    DepartmentName char(6),
    HOD char(5),
    ContactEmail varchar(10),
    PhoneNumber int,
    Location varchar(20));
    DESC DEPARTMENTS;
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  CREATE TABLE COURSE
  ( CourseID int PRIMARY KEY,
    CourseName char(10),
    Credits int,
    DepartmentID int,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    Duration varchar(7),
    Fee int);
    DESC COURSE;
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
CREATE TABLE STUDENTS
( StudentID int PRIMARY KEY,
  FirstName char(6),
  LastName char(4),
  Email varchar(10),
  DateOfBirth int,
  CourseID int,
  FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID));
  DESC STUDENTS;
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
CREATE TABLE FACULTY
( FacultyID int PRIMARY KEY,
  FacultyName char(7),
  DepartmentID int,
  FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
  Qualification varchar(8),
  Email varchar(10),
  PhoneNumber int);
  DESC FACULTY;
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
CREATE TABLE ENROLLMENTS
( EnrollmentID int PRIMARY KEY,
  StudentID int,
  FOREIGN KEY (StudentID) REFERENCES STUDENTS(StudentID),
  CourseID int,
  FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID),
  Semester varchar(3),
  Year int,
  Grade varchar(1));
  DESC ENROLLMENTS;
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:

-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
--  describe the structure of each table and copy paste the Output 
/* 'DepartmentID', 'int', 'NO', 'PRI', NULL, ''
'DepartmentName', 'char(6)', 'YES', '', NULL, ''
'HOD', 'char(5)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(10)', 'YES', '', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''
'Location', 'varchar(20)', 'YES', '', NULL, '' */

/* 'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'char(10)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Duration', 'varchar(7)', 'YES', '', NULL, ''
'Fee', 'int', 'YES', '', NULL, '' */

/* 'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'char(6)', 'YES', '', NULL, ''
'LastName', 'char(4)', 'YES', '', NULL, ''
'Email', 'varchar(10)', 'YES', '', NULL, ''
'DateOfBirth', 'int', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, '' */

/* 'FacultyID', 'int', 'NO', 'PRI', NULL, ''
'FacultyName', 'char(7)', 'YES', '', NULL, ''
'DepartmentID', 'int', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(8)', 'YES', '', NULL, ''
'Email', 'varchar(10)', 'YES', '', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, '' */

/* 'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Semester', 'varchar(3)', 'YES', '', NULL, ''
'Year', 'int', 'YES', '', NULL, ''
'Grade', 'varchar(1)', 'YES', '', NULL, '' */


-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
ALTER TABLE DEPARTMENTS
ADD ( NOOFDEPARTMENTS int,
      ProgramDirectors char(5));
DESC DEPARTMENTS;

ALTER TABLE COURSE
ADD (NOOFYEARS int,
     MINORS int);
     
ALTER TABLE STUDENTS
ADD (MIDDLENAME char(5),
     CourseName int,
     FOREIGN KEY (CourseName) REFERENCES COURSE(CourseName));
     
ALTER TABLE FACULTY
ADD (DepartmentName int,
     FOREIGN KEY (DepartmentName) REFERENCES Departments(DepartmentName),
     Experience int);
     
ALTER TABLE ENROLLMENTS
ADD (NOOFSEMESTERS int,
     Marks int);

-- 02: Modify the existing column from each table
ALTER TABLE DEPARTMENTS
MODIFY HOD char(7);

ALTER TABLE COURSE
MODIFY CourseName char(15);

ALTER TABLE STUDENTS
MODIFY Email varchar(15);

ALTER TABLE FACULTY
MODIFY Qualification varchar(10);

ALTER TABLE ENROLLMENTS
MODIFY Grade varchar(3);

-- 03 change the datatypes
ALTER TABLE DEPARTMENTS
MODIFY COLUMN DepartmentName varchar(8);
DESC DEPARTMENTS;

ALTER TABLE COURSE
MODIFY COLUMN CourseName varchar(10);
DESC COURSE;

ALTER TABLE STUDENTS
MODIFY COLUMN DateOfBirth DATE;
DESC STUDENTS;

ALTER TABLE FACULTY
MODIFY COLUMN FacultyName varchar(7);
DESC FACULTY;

ALTER TABLE ENROLLMENTS
MODIFY COLUMN StudentID varchar(6);
DESC ENROLLMENTS;

-- 04: Rename a column
ALTER TABLE FACULTY
RENAME COLUMN FacultyName TO NAMEOFFACULTY;
DESC FACULTY;

-- 05: Drop a column
ALTER TABLE COURSE
DROP COLUMN Credits;
DESC COURSE;

-- 06: Rename the table
ALTER TABLE ENROLLMENTS
RENAME TO ENROLLING;

-- 07: describe the structure of the new table
DESC ENROLLING;

/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
ALTER TABLE STUDENTS
ADD ADDRESS varchar(100);
DESC STUDENTS;

--2 Add a column Gender (CHAR(1)) to the Students table.
ALTER TABLE STUDENTS
ADD GENDER char(1);
DESC STUDENTS;

--3 Add a column JoiningDate (DATE) to the Faculty table.
ALTER TABLE FACULTY
ADD JOININGDATE DATE;
DESC FACULTY;

--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
ALTER TABLE COURSES
MODIFY COLUMN CourseName varchar(100);
DESC COURSES;

--5 Modify the column Location in the Departments table to VARCHAR(80).
ALTER TABLE DEPARTMENTS
MODIFY Location varchar(80);
DESC DEPARTMENTS;

--6 Rename the column Qualification in the Faculty table to Degree.
ALTER TABLE FACULTY
RENAME COLUMN Qualification TO Degree;
DESC FACULTY;

--7 Rename the table Faculty to Teachers.
ALTER TABLE FACULTY
RENAME TO TEACHERS;
DESC TEACHERS;

--8 Drop the column PhoneNumber from the Departments table.
ALTER TABLE DEPARTMENTS
DROP COLUMN PhoneNumber;
DESC DEPARTMENTS;

--9 Drop the column Email from the Students table.
ALTER TABLE STUDENTS
DROP COLUMN Email;
DESC STUDENTS;

--10 Drop the column Duration from the Courses table.
ALTER TABLE COURSE
DROP COLUMN Duration;
DESC COURSE;

*/

SHOW TABLES; -- Before dropping the table
/* Tables_in_collegemanagement
'teachers'
'students'
'enrolling'
'departments'
'course' – */

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
DROP TABLE COURSE;
DROP TABLE ENROLLING;


SHOW TABLES; -- After dropping the table Enrollement and Course

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01

