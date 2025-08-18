-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: PREETHI V
-- USN: 1RUA24BCA0071
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
#USER(),Host_Name,MySQL_Version,Current_Date_Time

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:
CREATE DATABASE DBLab001;
USE DBLab001;
-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:
CREATE TABLE STUDENTS
(  StudentID varchar(20),
   FirstName char(10),
   Email varchar(20),
   DOB date);
DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
/*'StudentID', 'varchar(20)', 'YES', '', NULL, ''
'FirstName', 'char(10)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', '', NULL, ''
'DOB', 'date', 'YES', '', NULL, ''*/


-- Alter the table and 2 new columns
ALTER TABLE STUDENTS
ADD (AGE int,
     Gender char(6));
-- Modify a column data type
ALTER TABLE STUDENTS
MODIFY Gender char(8);
-- Rename a column
ALTER TABLE STUDENTS
RENAME COLUMN AGE to STUDENTAGE;
-- Drop a column
ALTER TABLE STUDENTS
DROP COLUMN Gender;
-- Rename the table
ALTER TABLE STUDENTS
RENAME to StudentDetails;
DESC StudentDetails;


-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
CREATE TABLE COURSES
( CourseID int,
  CourseName varchar(10),
  Credits int);
DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :
/*'CourseID', 'int', 'YES', '', NULL, ''
'CourseName', 'varchar(10)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''*/

-- Alter the table and 2 new columns
ALTER TABLE COURSES
ADD ( Marks int,
      Noofhours varchar(6));
-- Modify a column data type
ALTER TABLE COURSES
MODIFY Noofhours int;
-- Rename a column
ALTER TABLE COURSES
RENAME COLUMN Noofhours to Totalhours;
-- Drop a column
ALTER TABLE COURSES
DROP Totalhours;
-- Rename the table
ALTER TABLE COURSES
RENAME to COURSEDETAILS;
DESC COURSEDETAILS;

-- OUTPUT:
/*'CourseID', 'int', 'YES', '', NULL, ''
'CourseName', 'varchar(10)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'Marks', 'int', 'YES', '', NULL, ''*/

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

CREATE TABLE STUDENTDETAILS
( StudentID int,
  StudentName char(10));
  
CREATE TABLE COURSEDETAILS
( CourseID int,
  CourseName varchar(15));
  
-- Write your SQL query below Codespace:
CREATE TABLE ENROLLMENTINFO
( EnrollmentID int,
  StudentID int,
  CourseID int,
  EnrollmentDate DATE,
  FOREIGN KEY(StudentID) REFERENCES StudentDetails(StudentID),
  FOREIGN KEY(CourseID) REFERENCES COURSESDETAILS(CourseName));
DESC ENROLLMENTINFO; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]

-- OUTPUT :
/*'EnrollmentID', 'int', 'YES', '', NULL, ''
'StudentID', 'int', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', '', NULL, ''
'EnrollmentDate', 'date', 'YES', '', NULL, ''*/

-- Alter the table and 2 new columns
ALTER TABLE ENROLLMENTINFO
ADD ( CourseCode int,
      School varchar(20));
-- Modify a column data type
ALTER TABLE ENROLLMENTINFO
MODIFY School varchar(25);
-- Rename a column
ALTER TABLE ENROLLMENTINFO
RENAME COLUMN School to CourseName;
-- Drop a column
ALTER TABLE ENROLLMENTINFO
DROP COLUMN CourseCode;
-- Rename the table
ALTER TABLE ENROLLMENTINFO
RENAME to COURSEENROLLMENTINFO;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:

DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:

SHOW TABLES; -- After dropping the table Enrollement and Course

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01

