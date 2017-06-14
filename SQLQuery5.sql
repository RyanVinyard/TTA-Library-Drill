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
