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
