CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    AvailableCopies INT
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE IssueRecords (
    IssueID INT PRIMARY KEY,
    BookID INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    MemberID INT,
	FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    IssueDate DATE,
    ReturnDate DATE);

INSERT INTO Books (BookID,Title, Author, AvailableCopies) VALUES
(101,'The Alchemist', 'Paulo Coelho', 3),
(102,'Harry Potter', 'J.K. Rowling', 2),
(103,'Data Structures', 'Narasimha Karumanchi', 5);

INSERT INTO Members (MemberID,MemberName, JoinDate) VALUES
(201,'Ravi Kumar', '2024-06-01'),
(202,'Priya Sharma', '2024-07-15');

INSERT INTO IssueRecords (IssueID,BookID, MemberID, IssueDate, ReturnDate)
VALUES
(301,101, 201, '2025-10-20', '2025-10-25'),
(302,102, 202, '2025-10-22', '2025-09-24'),
(303,103, 201, '2025-10-21', '2025-10-26');

SELECT I.IssueID,M.MemberName,B.Title,I.IssueDate,I.ReturnDate
FROM IssueRecords I
JOIN Members M ON I.MemberID = M.MemberID
JOIN Books B ON I.BookID = B.BookID;

SELECT M.MemberName,
COUNT(I.BookID) AS TotalBooksIssued
FROM IssueRecords I
JOIN Members M ON I.MemberID = M.MemberID
GROUP BY M.MemberName;

SELECT IssueID,
DATEDIFF(ReturnDate, IssueDate) AS DaysBorrowed
FROM IssueRecords
WHERE ReturnDate IS NOT NULL;

DELIMITER //
CREATE PROCEDURE ReturnBook(
    IN b_id INT
)
BEGIN
    UPDATE Books
    SET AvailableCopies = AvailableCopies + 1
    WHERE BookID = b_id;
END //
DELIMITER ;

CALL ReturnBook(1);

