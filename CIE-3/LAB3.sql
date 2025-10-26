-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Preethi V
-- USN: 1RUA24BCA0071
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 

CREATE DATABASE LIBRARY;
USE LIBRARY;
CREATE TABLE BOOKS
( BookID int PRIMARY KEY,
  BookName char(10),
  typeofbook varchar(8));
  desc BOOKS;
  
CREATE TABLE MEMBERS
( MemberID int PRIMARY KEY,
  Name char(8),
  BookNo varchar(9),
  Noofbooks int);
  desc MEMBERS;


-- Paste the Output below for the given command ( DESC TableName;) 
/* # Field, Type, Null, Key, Default, Extra
   'BookID', 'int', 'NO', 'PRI', NULL, ''
   'BookName', 'char(10)', 'YES', '', NULL, ''
   'typeofbook', 'varchar(8)', 'YES', '', NULL, '' */

/* # Field, Type, Null, Key, Default, Extra
   'MemberID', 'int', 'NO', 'PRI', NULL, ''
   'Name', 'char(8)', 'YES', '', NULL, ''
   'BookNo', 'varchar(9)', 'YES', '', NULL, ''
   'Noofbooks', 'int', 'YES', '', NULL, '' */

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
desc BOOKS;
INSERT INTO BOOKS VALUES
(1,'TheBlackNa','FICTION8'),
(2,'physics','Science9'),
(3,'HARRYPOTT','FICTION5'),
(4,'BIOLOGY','SCIENCE8');

SELECT * FROM BOOKS;

ALTER TABLE BOOKS
ADD NOOFPAGES int;
desc BOOKS;

UPDATE BOOKS set NOOFPAGES = '8'

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/* # BookID, BookName, typeofbook
   '1', 'TheBlackNa', 'FICTION8'
   '2', 'physics', 'Science9'
   '3', 'HARRYPOTT', 'FICTION5'
   '4', 'BIOLOGY', 'SCIENCE8'*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 