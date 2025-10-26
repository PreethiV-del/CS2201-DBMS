CREATE DATABASE MARKSCARD;
USE MARKSCARD;

CREATE TABLE MARKSCARD (
StudentID INT PRIMARY KEY,
Name varchar(20),
Subject varchar(35),
marksobtained int,
Examtype varchar(20),
Grade char(2),
ResultStatus varchar(10));

DESC MARKSCARD;

-- OUTPUT: 
/*# Field, Type, Null, Key, Default, Extra
'StudentID', 'int', 'NO', 'PRI', NULL, ''
'Name', 'varchar(20)', 'YES', '', NULL, ''
'Subject', 'varchar(35)', 'YES', '', NULL, ''
'marksobtained', 'int', 'YES', '', NULL, ''
'Examtype', 'varchar(20)', 'YES', '', NULL, ''
'Grade', 'char(2)', 'YES', '', NULL, ''
'ResultStatus', 'varchar(10)', 'YES', '', NULL, ''*/


INSERT INTO MARKSCARD (StudentID, Name, Subject, marksobtained, Examtype, Grade, ResultStatus)
VALUES
(1,'Aarav','Mathematics',88,'Midterm','A','Pass'),
(2,'Diya','Science',76,'Final','B+','Pass'),
(3,'Rohan','English',59,'Unit Test','C','Pass'),
(4,'Sneha','Social Studies',92,'Final','A+','Pass'),
(5,'Karthik','Mathematics',33,'Midterm','F','Fail'),
(6,'Meera','Science',81,'Unit Test','A','Pass'),
(7,'Yash','English',45,'Final','D','Pass'),
(8,'Ananya','Social Studies',67,'Midterm','B','Pass'),
(9,'Rahul','Mathematics',29,'Final','F','Fail'),
(10,'Ishita','Science',74,'Midterm','B+','Pass');

DESC MARKSCARD;
SELECT * FROM MARKSCARD;

-- OUTPUT:-
/*# StudentID, Name, Subject, marksobtained, Examtype, Grade, ResultStatus
'1', 'Aarav', 'Mathematics', '88', 'Midterm', 'A', 'Pass'
'2', 'Diya', 'Science', '76', 'Final', 'B+', 'Pass'
'3', 'Rohan', 'English', '59', 'Unit Test', 'C', 'Pass'
'4', 'Sneha', 'Social Studies', '92', 'Final', 'A+', 'Pass'
'5', 'Karthik', 'Mathematics', '33', 'Midterm', 'F', 'Fail'
'6', 'Meera', 'Science', '81', 'Unit Test', 'A', 'Pass'
'7', 'Yash', 'English', '45', 'Final', 'D', 'Pass'
'8', 'Ananya', 'Social Studies', '67', 'Midterm', 'B', 'Pass'
'9', 'Rahul', 'Mathematics', '29', 'Final', 'F', 'Fail'
'10', 'Ishita', 'Science', '74', 'Midterm', 'B+', 'Pass' */

ALTER TABLE MARKSCARD
ADD(maxmarks int);

DESC MARKSCARD;

-- OUTPUT:-
/*# Field, Type, Null, Key, Default, Extra
'StudentID', 'int', 'NO', 'PRI', NULL, ''
'Name', 'varchar(20)', 'YES', '', NULL, ''
'Subject', 'varchar(35)', 'YES', '', NULL, ''
'marksobtained', 'int', 'YES', '', NULL, ''
'Examtype', 'varchar(20)', 'YES', '', NULL, ''
'Grade', 'char(2)', 'YES', '', NULL, ''
'ResultStatus', 'varchar(10)', 'YES', '', NULL, ''
'maxmarks', 'int', 'YES', '', NULL, '' */

ALTER TABLE Markscard RENAME TO AcademicPerformance;

ALTER TABLE AcademicPerformance
DROP COLUMN Grade;

DESC AcademicPerformance;

-- OUTPUT:-
/*# Field, Type, Null, Key, Default, Extra
'StudentID', 'int', 'NO', 'PRI', NULL, ''
'Name', 'varchar(20)', 'YES', '', NULL, ''
'Subject', 'varchar(35)', 'YES', '', NULL, ''
'marksobtained', 'int', 'YES', '', NULL, ''
'Examtype', 'varchar(20)', 'YES', '', NULL, ''
'ResultStatus', 'varchar(10)', 'YES', '', NULL, ''
'maxmarks', 'int', 'YES', '', NULL, '' */
