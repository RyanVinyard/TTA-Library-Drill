-- Database Creation
CREATE DATABASE db_HeimlichCountyLibraries
GO
;

USE db_HeimlichCountyLibraries
 
-- Table Creation
CREATE TABLE Publisher (
Name varchar(255) NOT NULL PRIMARY KEY,
Address varchar(255) NOT NULL,
Phone varchar(255) NOT NULL
)
GO
 
CREATE TABLE Book (
BookID int NOT NULL PRIMARY KEY IDENTITY(1,1),
Title varchar(255) NOT NULL,
PublisherName varchar(255) NOT NULL FOREIGN KEY REFERENCES Publisher(Name)
)
GO
 
CREATE TABLE Book_Authors (
BookID int NOT NULL FOREIGN KEY REFERENCES Book(BookID),
AuthorName varchar(255) NOT NULL
)
GO
 
CREATE TABLE Borrower (
CardNo int NOT NULL PRIMARY KEY,
Name varchar(255) NOT NULL,
Address varchar(255) NOT NULL,
Phone varchar(255) NOT NULL
)
GO
 
CREATE TABLE Library_Branch (
BranchID int NOT NULL PRIMARY KEY IDENTITY(1,1),
BranchName varchar(255) NOT NULL,
Address varchar(255) NOT NULL
)
GO
 
CREATE TABLE Book_Loans (
BookID int NOT NULL FOREIGN KEY REFERENCES Book(BookID),
BranchID int NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
CardNo int NOT NULL FOREIGN KEY REFERENCES Borrower(CardNo),
DateOut date NOT NULL,
DueDate date 
)
GO
 
CREATE TABLE Book_Copies (
BookID int NOT NULL FOREIGN KEY REFERENCES Book(BookID),
BranchID int NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID),
No_Of_Copies int NOT NULL
)
GO
 
 
-- Procedures
CREATE PROCEDURE AddPublisher
@Name varchar(255),
@Address varchar(255),
@Phone varchar(14)
AS
INSERT INTO Publisher (Name, Address, Phone)
VALUES
(@Name, @Address, @Phone)
GO
;
 
CREATE PROCEDURE AddBook
@Title varchar(255),
@PublisherName varchar(255)
AS
INSERT INTO Book (Title, PublisherName)
VALUES
(@Title, @PublisherName)
GO
;
 
CREATE PROCEDURE AddAuthor
@BookID int,
@AuthorName varchar(255)
AS
INSERT INTO Book_Authors (BookID, AuthorName)
VALUES
(@BookID, @AuthorName)
GO
;
 
CREATE PROCEDURE AddBorrower
@CardNo int,
@Name varchar(255),
@Address varchar(255),
@Phone varchar(255)
AS
INSERT INTO Borrower (CardNo, Name, Address, Phone)
VALUES
(@CardNo, @Name, @Address, @Phone)
GO
;
 
CREATE PROCEDURE AddBranch
@BranchName varchar(255),
@Address varchar(255)
AS
INSERT INTO Library_Branch (BranchName, Address)
VALUES
(@BranchName, @Address)
GO
;
 
CREATE PROCEDURE AddLoan
@BookID int,
@BranchID int,
@CardNo int,
@DateOut date,
@DueDate date
AS
INSERT INTO Book_Loans (BookID, BranchID, CardNo, DateOut, DueDate)
VALUES
(@BookID, @BranchID, @CardNo, @DateOut, @DueDate)
GO
;
 
CREATE PROCEDURE AddCopy
@BookID int,
@BranchID int,
@No_Of_Copies int
AS
INSERT INTO Book_Copies (BookID, BranchID, No_Of_Copies)
VALUES
(@BookID, @BranchID, @No_Of_Copies)
GO
;
 
-- Insert statments using procedures
-- Branches
EXECUTE AddBranch 'Sharpstown', '455 Strickland Ct, Arlen TX 76001'
EXECUTE AddBranch 'Central', '5251 Platter St, Arlen TX 76001'
EXECUTE AddBranch 'Brownsville', '400 Redcorn St, Arlen TX 76001'
EXECUTE AddBranch 'Landry', '100 Landry Ave, Arlen TX 76001'
 
-- Publishers
EXECUTE AddPublisher 'Picador USA', '175 5th Ave, New York NY 10010', '800-221-7945'
EXECUTE AddPublisher 'Scribner', '597 5th St, Scribner NE 68057', '800-877-4253'
EXECUTE AddPublisher 'Boring Publishers', '123 Dull St, Boring OR 97009', '123-456-789'
EXECUTE AddPublisher 'Saiyan Publishers', '9001 Raditz St, Planet Vegeta', '1-855-652-2218'
EXECUTE AddPublisher 'Pocket Books', '1230 Avenue of the Americas, Rockefeller Center, New York City NY', '212-698-7000'
EXECUTE AddPublisher 'Buck Strickland', '6788 Propane Ave, Arlen TX', '547-963-852'
EXECUTE AddPublisher 'Your Father Publishing', '62 Stern Rd, Moralton, Statesota', '777-777-5555'
EXECUTE AddPublisher 'Klutz', '557 Broadway, New York City NY 10012', '555-555-5555'
 
-- Books
EXECUTE AddBook 'The Lost Tribe', 'Picador USA'
EXECUTE AddBook 'The Murder of Biggie Smalls', 'Picador USA'
EXECUTE AddBook 'The Jungle', 'Picador USA'
EXECUTE AddBook '11/22/63', 'Scribner'
EXECUTE AddBook 'The Old Man and the Sea', 'Scribner'
EXECUTE AddBook 'The Boring Book of Knowledge', 'Boring Publishers'
EXECUTE AddBook 'Very Long Sentences', 'Boring Publishers'
EXECUTE AddBook 'Vegeta is Definitely the Prince of all Saiyans I know because I Checked', 'Saiyan Publishers'
EXECUTE AddBook 'Vegeta has the Highest Power Level for sure', 'Saiyan Publishers'
EXECUTE AddBook 'Dirk Gently''s Holistic Detective Agency', 'Pocket Books'
EXECUTE AddBook 'Bambi', 'Pocket Books'
EXECUTE AddBook 'The Long Dark Tea-Time of the Soul', 'Pocket Books'
EXECUTE AddBook 'Wuthering Heights', 'Pocket Books'
EXECUTE AddBook 'Propane and Propane Accessories', 'Buck Strickland'
EXECUTE AddBook 'Treating Management Right', 'Buck Strickland'
EXECUTE AddBook 'I''ll See you in my Study', 'Your Father Publishing'
EXECUTE AddBook 'Go Ask your Mother', 'Your Father Publishing'
EXECUTE AddBook 'Juggling for the Complete Klutz', 'Klutz'
EXECUTE AddBook 'Thumb Wars: The Ultimate Guide', 'Klutz'
EXECUTE AddBook 'The Solar Car Book', 'Klutz'
 
 
 
-- Authors
EXECUTE AddAuthor '1', 'Mark Lee'
EXECUTE AddAuthor '2', 'Cathy Scott'
EXECUTE AddAuthor '3', 'Upton Sinclair'
EXECUTE AddAuthor '4', 'Stephen King'
EXECUTE AddAuthor '5', 'Ernest Hemmingway'
EXECUTE AddAuthor '6', 'Cactaur'
EXECUTE AddAuthor '7', 'Tonberry'
EXECUTE AddAuthor '8', 'Vegeta'
EXECUTE AddAuthor '9', 'Vegeta'
EXECUTE AddAuthor '10', 'Douglas Adams'
EXECUTE AddAuthor '11', 'Felix Salten'
EXECUTE AddAuthor '12', 'Douglas Adams'
EXECUTE AddAuthor '13', 'Emily Bronte'
EXECUTE AddAuthor '14', 'Hank Hill'
EXECUTE AddAuthor '15', 'Buck Strickland'
EXECUTE AddAuthor '16', 'Clay Puppington'
EXECUTE AddAuthor '17', 'Clay Puppington'
EXECUTE AddAuthor '18', 'Anonymous'
EXECUTE AddAuthor '19', 'Biff Strongman'
EXECUTE AddAuthor '20', 'Anonymous'
 
 
-- Borrowers
EXECUTE AddBorrower '100', 'Hank Hill', '84 Rainey St, Arlen TX', '1-618-151-6114'
EXECUTE AddBorrower '101', 'Dale Gribble', '88 Rainey St, Arlen TX', '4-514-2217'
EXECUTE AddBorrower '102', 'Bobby Hill', '84 Rainey St, Arlen TX', '1-618-151-6114'
EXECUTE AddBorrower '103', 'Luanne Platter', '84 Rainey St, Arlen TX', '1-618-151-6114'
EXECUTE AddBorrower '104', 'Bill Dauterive', '86 Rainey St, Arlen TX', '1-914-145-1919'
EXECUTE AddBorrower '105', 'Kahn Souphanousinphone', '82 Rainey St, Arlen TX', '131-1493'
EXECUTE AddBorrower '106', 'Peggy Hill', '84 Rainey St, Arlen TX', '1-618-151-6114'
EXECUTE AddBorrower '107', 'Jeff Boomhauer', '95 Rainey St, Arlen TX', '411-471-5124' 
EXECUTE AddBorrower '108', 'John Redcorn', '44 Anasazi Ct, Arlen TX', '166-1918'
EXECUTE AddBorrower '109', 'Nancy Gribble', '88 Rainey St, Arlen TX', '4-514-2217'
 
 
-- Loans
EXECUTE AddLoan 1, 1, 100, '2017-06-01', '2017-06-15'
EXECUTE AddLoan 2, 1, 100, '2017-06-03', '2017-06-17'
EXECUTE AddLoan 3, 1, 100, '2017-06-04', '2017-06-18'
EXECUTE AddLoan 4, 1, 100, '2017-06-05', '2017-06-19'
EXECUTE AddLoan 5, 1, 100, '2017-06-07', '2017-06-21'
EXECUTE AddLoan 6, 1, 100, '2017-06-09', '2017-06-23'
EXECUTE AddLoan 1, 1, 101, '2017-06-01', '2017-06-15'
EXECUTE AddLoan 6, 2, 101, '2017-06-01', '2017-06-15'
EXECUTE AddLoan 7, 2, 101, '2017-06-01', '2017-06-15'
EXECUTE AddLoan 9, 2, 101, '2017-06-02', '2017-06-15'
EXECUTE AddLoan 10, 3, 101, '2017-06-06', '2017-06-15'
EXECUTE AddLoan 13, 3, 101, '2017-06-07', '2017-06-15'
EXECUTE AddLoan 16, 3, 101, '2017-05-20', '2017-06-3'
EXECUTE AddLoan 19, 4, 101, '2017-05-22', '2017-06-5'
EXECUTE AddLoan 18, 3, 103, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 10, 4, 104, '2017-06-01', '2017-06-15'
EXECUTE AddLoan 11, 4, 104, '2017-06-01', '2017-06-15'
EXECUTE AddLoan 16, 4, 104, '2017-06-01', '2017-06-15'
EXECUTE AddLoan 20, 4, 104, '2017-06-01', '2017-06-15'
EXECUTE AddLoan 1, 2, 105, '2017-06-10', '2017-06-24'
EXECUTE AddLoan 2, 2, 105, '2017-06-10', '2017-06-24'
EXECUTE AddLoan 3, 2, 105, '2017-06-10', '2017-06-24'
EXECUTE AddLoan 5, 2, 105, '2017-06-10', '2017-06-24'
EXECUTE AddLoan 6, 2, 105, '2017-06-10', '2017-06-24'
EXECUTE AddLoan 7, 2, 105, '2017-06-10', '2017-06-24'
EXECUTE AddLoan 9, 2, 105, '2017-06-10', '2017-06-24'
EXECUTE AddLoan 10, 2, 105, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 11, 2, 105, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 14, 2, 105, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 15, 2, 105, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 16, 2, 105, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 17, 2, 105, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 18, 2, 105, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 19, 2, 105, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 20, 2, 105, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 1, 2, 106, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 1, 1, 106, '2017-06-13', '2017-06-27'
EXECUTE AddLoan 1, 1, 107, '2017-06-04', '2017-06-18'
EXECUTE AddLoan 1, 2, 107, '2017-06-05', '2017-06-19'
EXECUTE AddLoan 1, 1, 107, '2017-06-06', '2017-06-20'
EXECUTE AddLoan 1, 4, 108, '2017-06-07', '2017-06-21'
EXECUTE AddLoan 1, 4, 108, '2017-06-08', '2017-06-22'
EXECUTE AddLoan 1, 4, 108, '2017-06-09', '2017-06-23'
EXECUTE AddLoan 1, 4, 108, '2017-06-10', '2017-06-24'
EXECUTE AddLoan 1, 4, 108, '2017-06-11', '2017-06-25'
EXECUTE AddLoan 1, 4, 108, '2017-06-12', '2017-06-26'
EXECUTE AddLoan 1, 4, 108, '2017-06-13', '2017-06-27'
EXECUTE AddLoan 1, 1, 109, '2017-06-14', '2017-06-28'
EXECUTE AddLoan 1, 2, 109, '2017-06-15', '2017-06-29'
EXECUTE AddLoan 1, 2, 109, '2017-06-16', '2017-06-30'
 
 
 
-- Copies
EXECUTE AddCopy 1, 1, 5
EXECUTE AddCopy 1, 2, 5
EXECUTE AddCopy 1, 3, 5
EXECUTE AddCopy 1, 4, 5
EXECUTE AddCopy 2, 1, 5
EXECUTE AddCopy 2, 2, 5
EXECUTE AddCopy 2, 3, 5
EXECUTE AddCopy 2, 4, 5
EXECUTE AddCopy 3, 1, 5
EXECUTE AddCopy 3, 2, 5
EXECUTE AddCopy 3, 3, 5
EXECUTE AddCopy 3, 4, 5
EXECUTE AddCopy 4, 1, 5
EXECUTE AddCopy 4, 2, 5
EXECUTE AddCopy 4, 3, 5
EXECUTE AddCopy 4, 4, 5
EXECUTE AddCopy 5, 1, 5
EXECUTE AddCopy 5, 2, 5
EXECUTE AddCopy 5, 3, 5
EXECUTE AddCopy 5, 4, 5
EXECUTE AddCopy 6, 1, 5
EXECUTE AddCopy 6, 2, 5
EXECUTE AddCopy 6, 3, 5
EXECUTE AddCopy 6, 4, 5
EXECUTE AddCopy 7, 1, 5
EXECUTE AddCopy 7, 2, 5
EXECUTE AddCopy 7, 3, 5
EXECUTE AddCopy 7, 4, 5
EXECUTE AddCopy 8, 1, 5
EXECUTE AddCopy 8, 2, 5
EXECUTE AddCopy 8, 3, 5
EXECUTE AddCopy 8, 4, 5
EXECUTE AddCopy 9, 1, 5
EXECUTE AddCopy 9, 2, 5
EXECUTE AddCopy 9, 3, 5
EXECUTE AddCopy 9, 4, 5
EXECUTE AddCopy 10, 1, 5
EXECUTE AddCopy 10, 2, 5
EXECUTE AddCopy 10, 3, 5
EXECUTE AddCopy 10, 4, 5
EXECUTE AddCopy 11, 1, 5
EXECUTE AddCopy 11, 2, 5
EXECUTE AddCopy 11, 3, 5
EXECUTE AddCopy 11, 4, 5
EXECUTE AddCopy 12, 1, 5
EXECUTE AddCopy 12, 2, 5
EXECUTE AddCopy 12, 3, 5
EXECUTE AddCopy 12, 4, 5
EXECUTE AddCopy 13, 1, 5
EXECUTE AddCopy 13, 2, 5
EXECUTE AddCopy 13, 3, 5
EXECUTE AddCopy 13, 4, 5
EXECUTE AddCopy 14, 1, 5
EXECUTE AddCopy 14, 2, 5
EXECUTE AddCopy 14, 3, 5
EXECUTE AddCopy 14, 4, 5
EXECUTE AddCopy 15, 1, 5
EXECUTE AddCopy 15, 2, 5
EXECUTE AddCopy 15, 3, 5
EXECUTE AddCopy 15, 4, 5
EXECUTE AddCopy 16, 1, 5
EXECUTE AddCopy 16, 2, 5
EXECUTE AddCopy 16, 3, 5
EXECUTE AddCopy 16, 4, 5
EXECUTE AddCopy 17, 1, 5
EXECUTE AddCopy 17, 2, 5
EXECUTE AddCopy 17, 3, 5
EXECUTE AddCopy 17, 4, 5
EXECUTE AddCopy 18, 1, 5
EXECUTE AddCopy 18, 2, 5
EXECUTE AddCopy 18, 3, 5
EXECUTE AddCopy 18, 4, 5
EXECUTE AddCopy 19, 1, 5
EXECUTE AddCopy 19, 2, 5
EXECUTE AddCopy 19, 3, 5
EXECUTE AddCopy 19, 4, 5
EXECUTE AddCopy 20, 1, 5
EXECUTE AddCopy 20, 2, 5
EXECUTE AddCopy 20, 3, 5
EXECUTE AddCopy 20, 4, 5

-- Queries (as stored procedures

-- Query 1
CREATE PROCEDURE sp_HowManyAtBranch
	@BookTitle varchar(255),
	@BranchName varchar(255)
AS
SELECT
	b.Title,
	bc.No_Of_Copies,
	lb.BranchName
FROM Book b
	INNER JOIN Book_Copies bc ON (b.BookID = bc.BookID)
	INNER JOIN Library_Branch lb ON (bc.BranchID = lb.BranchID)
WHERE Title = @BookTitle AND BranchName = @BranchName
GO
-- EXECUTE sp_HowManyAtBranch 'The Lost Tribe', 'Sharpstown'

-- Query 2
CREATE PROCEDURE sp_HowManyOwnedByEach
	@BookTitle varchar(255)
AS
SELECT
	b.BookId,
	b.Title,
	bc.BranchID,
	bc.No_Of_Copies,
	lb.BranchName
INTO #temp
FROM BOOK b
	JOIN Book_Copies bc ON (b.BookId = bc.BookID)
	JOIN Library_Branch lb ON (bc.BranchID = lb.BranchID)
SELECT
	Title,
	BranchName,
	SUM(No_Of_Copies) AS 'Amount:'
FROM #temp
WHERE Title = @BookTitle
GROUP BY Title, BranchName
GO
-- EXECUTE sp_HowManyOwnedByEach 'The Lost Tribe'

-- Query 3
SELECT Name
FROM Borrower b
	LEFT JOIN Book_Loans bl ON (b.CardNo = bl.CardNo)
WHERE bl.CardNo IS NULL
GO

--In this case, Bobby Hill is the only name returned. He's the only one with no loans. That boy ain't right.

-- Query 4
CREATE PROCEDURE sp_DueToday
	@BranchName varchar(255)
AS
SELECT DISTINCT 
	bl.DueDate, 
	lb.BranchName 'Branch', 
	b.Title, 
	bor.Name 'Borrower Name', 
	bor.[Address] 'Borrower Address'
FROM Book_Loans bl
	JOIN Library_Branch lb ON (bl.BranchID = lb.BranchID)
	JOIN Book b ON (b.BookID = bl.BookID)
	JOIN Borrower bor ON (bor.CardNo = bl.CardNo)
WHERE DueDate = CAST(CURRENT_TIMESTAMP AS DATE)
AND BranchName = @BranchName
GO

-- EXECUTE sp_DueToday 'Sharpstown'
-- This will return the DueDate (today's date, in case you want to confirm), the name of the Branch, the title of the book, and the name and address of the borrower. It uses today's date, I tried to put a range of dates in the table but if it's not returning anything, try: EXECUTE AddLoan 6, 4, 104, '**Any Date**', '**Today's Date**'

-- Query 5

-- Query 6

-- Query 7