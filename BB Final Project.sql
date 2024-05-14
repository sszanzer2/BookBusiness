--DROP DATABASE [Bookselling business]
CREATE database [Bookselling business]
use [Bookselling business]
go
DROP table BB_Book

CREATE TABLE [dbo].[BB_Author]
(
[Author_ID] [int] IDENTITY(1,1) NOT NULL,
[LastName] [varchar](50) NOT NULL,
[FirstName] [varchar](50) NULL,
[MiddleInitials] [varchar](10) NULL,
[Title] [varchar](10) NULL,
CONSTRAINT [PK_BB_Author] PRIMARY KEY CLUSTERED ( [Author_ID] ASC ),
CONSTRAINT [UK_BB_Author] UNIQUE ([LastName],[FirstName],
[MiddleInitials],[Title])
)
GO
CREATE TABLE [dbo].[BB_Owner]
(
[Owner_ID] [int] IDENTITY(1,1) NOT NULL,
[LastName] [varchar](50) NOT NULL,
[FirstName] [varchar](50) NULL,
[MiddleInitials] [varchar](10) NULL,
CONSTRAINT [PK_BB_Owner] PRIMARY KEY CLUSTERED ( [Owner_ID] ASC ),
CONSTRAINT [UK_BB_Owner] UNIQUE ([LastName],[FirstName],
[MiddleInitials])
)
GO

CREATE TABLE [dbo].[BB_Employee]
(
[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
[FirstName] [varchar](50) NOT NULL,
[LastName] [varchar](50) NULL,
[MiddleInitials] [varchar](10) NULL,
[Location_ID] [int] NULL FOREIGN KEY REFERENCES [BB_StoreLocation](Location_ID),
CONSTRAINT [PK_BB_Employee] PRIMARY KEY CLUSTERED ( [Employee_ID] ASC ),
CONSTRAINT [UK_BB_Employee] UNIQUE ([LastName],[FirstName],
[MiddleInitials])
)
GO

CREATE TABLE [dbo].[BB_JNC_CustomerInfo]
(
[Customer_ID] [int] NOT NULL FOREIGN KEY REFERENCES [BB_Customer](Customer_ID),
[Purchase_ID] [int] NOT NULL FOREIGN KEY REFERENCES [BB_Purchases](Purchase_ID),
CONSTRAINT [PK_BB_JNCT_CustomerInfo] PRIMARY KEY CLUSTERED
( [Customer_ID], [Purchase_ID] ASC )
)
GO

drop table BB_JNC_CustomerInfo
--dx create
CREATE TABLE [dbo].[BB_Customer]
(
[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
[FirstName] [varchar](50) NOT NULL,
[LastName] [varchar](50) NOT NULL,
[MiddleInitials] [varchar](10) NULL,
[Loyal Customer] [varchar](10) NOT NULL,
[Location_ID] [int] NULL FOREIGN KEY REFERENCES [BB_StoreLocation](Location_ID),
CONSTRAINT [PK_BB_Customer] PRIMARY KEY CLUSTERED ( [Customer_ID] ASC ),
CONSTRAINT [UK_BB_Customer] UNIQUE ([LastName],[FirstName],
[MiddleInitials])
)
GO
--dx create
CREATE TABLE [dbo].[BB_CustomerAddresses]
(
[CustomerAddresses_ID] [int] IDENTITY(1,1) NOT NULL,
[Name] [varchar](50) NOT NULL,
[Street] [varchar](50) NOT NULL,
[City] [varchar](50) NOT NULL,
[State] [varchar](50) NOT NULL,
[Zip] [int] NULL,
[Customer_ID] [int] NULL FOREIGN KEY REFERENCES [BB_Customer](Customer_ID),
CONSTRAINT [PK_BB_CustomerAddresses] PRIMARY KEY CLUSTERED ( [CustomerAddresses_ID] ASC ),
CONSTRAINT [UK_BB_CustomerAddresses] UNIQUE ([Customer_ID])
)
GO
--dx create
CREATE TABLE [dbo].[BB_Purchases]
(
[Purchase_ID] [int] IDENTITY(1,1) NOT NULL,
[Book_ID] [int] NULL FOREIGN KEY REFERENCES [BB_Book](Book_ID),
[Date Purchased] Date NOT NULL,
[Wholesale Price] [money] NOT NULL,
[Retail Price] [money] NOT NULL,
[Location_ID] [int] NULL FOREIGN KEY REFERENCES [BB_StoreLocation](Location_ID),
[Customer_ID] [int] NULL FOREIGN KEY REFERENCES [BB_Customer](Customer_ID),
CONSTRAINT [PK_BB_Purchases] PRIMARY KEY CLUSTERED ( [Purchase_ID] ASC )
)
GO
drop table BB_Purchases

CREATE TABLE [dbo].[BB_StoreLocation]
(
[Location_ID] [int] IDENTITY(1,1) NOT NULL,
[Store Location] [varchar](50) NOT NULL,
[OwnerID] [int] NULL FOREIGN KEY REFERENCES [BB_Owner](Owner_ID),
CONSTRAINT [PK_BB_Location] PRIMARY KEY CLUSTERED ( [Location_ID]
ASC ),
CONSTRAINT [UK_BB_Location] UNIQUE ([Store Location], [OwnerID])
)
GO

CREATE TABLE [dbo].[BB_Book]
(
[Book_ID] [int] IDENTITY(1,1) NOT NULL,
[Title] [varchar](100) NOT NULL,
[ISBN] [varchar](20) NOT NULL,
[Edition] [varchar](20) NULL,
[Year] [int] NULL,
[Rating] [int] NULL,
[Quantity] [float] NOT NULL,
[Location_ID] [int] NULL FOREIGN KEY REFERENCES
[BB_StoreLocation](Location_ID),
CONSTRAINT [PK_BB_Book] PRIMARY KEY CLUSTERED ( [Book_ID] ASC ),
CONSTRAINT [UK_ISBN] UNIQUE(ISBN)
)
GO

ALTER TABLE bb_Book
ADD Quantity float NOT NULL;?


CREATE TABLE [dbo].[BB_JNC_AuthorBook]
(
[Author_ID] [int] NOT NULL FOREIGN KEY REFERENCES [BB_Author]
(Author_ID),
[Book_ID] [int] NOT NULL FOREIGN KEY REFERENCES [BB_Book]
(Book_ID),
CONSTRAINT [PK_BB_JNCT_AuthorBook] PRIMARY KEY CLUSTERED
( [Author_ID], [Book_ID] ASC )
)
GO

/*CREATE TABLE [dbo].[BB_Prices]
(
[Price_ID] [int] NOT NULL IDENTITY(1,1),
[Book_ID] [int] NOT NULL FOREIGN KEY REFERENCES [BB_Book],
[Wholesale Price] [money] NOT NULL,
[Retail Price] [money] NOT NULL,
[Quantity] [float] NOT NULL,
CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED ([Price_ID] ASC),
CONSTRAINT [UK_Transactions] UNIQUE ([Book_ID])
)
GO*/



INSERT INTO BB_Author (FirstName, MiddleInitials, LastName,  Title)
Values ('Mark',NULL, 'Twain',NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName,  Title)
Values ('Lewis', NULL, 'Carol', NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName,  Title)
Values ('Jane', NULL, 'Austen', NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName, Title)
Values ('Thomas', NULL, 'Moor', 'Sir')
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName, Title)
Values ('Charles', NULL, 'Dickens', NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName, Title)
Values ('Jonathon', NULL, 'Swift', NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName,  Title)
Values ('Harper', NULL, 'Lee', NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName,  Title)
Values ('Scott', 'F.', 'Fitzgerald', NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName, Title)
Values ('Nathaniel', NULL, 'Hawthorne', NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName, Title)
Values ('Margaret', NULL, 'Mitchell',NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName, Title)
Values ('Louisa', 'May', 'Alcott', NULL)
INSERT INTO BB_Author (FirstName, MiddleInitials, LastName, Title)
Values ('Emily', NULL, 'Dickison', NULL)

INSERT INTO BB_StoreLocation([Store Location], OwnerID) VALUES('Brooklyn', 1),('Manhattan', 2), ('Queens', 3),
('Bronx', 4), ('Long Island', 5)
GO
  
INSERT INTO BB_Book
(Title,
ISBN, Edition,
Year,Rating,Location_ID)
Values
('Adventures of Tom Sawyer','0-201-83595-9', 'Aniversary', 1995, 5,3),
('Alice in Wonderland','0-201-00650-2', '1', 1982, 5,1),
('Pride and Prejudice','0-932633-43-9', '2', 1999, 5,4),
('Utopia','0-936233-05-6', '1', 1987, 5,1),
('A Tale of Two Cities','0-201-10331-1', 'Reprinted', 1989, 5,5),
('David Copperfield ','0-201-11889-0', '1', 1988, 5,1),
('Gulliver’s Travels','1-881526-91-7', '1', 1996, 5,1),
('To Kill a Mockingbird','0-9370-7380-6', '1', 1992, 5,3),
('The Great Gatsby','0-932633-39-0', '1', 1997, 5,1),
('The Adventures of Huckleberry Finn','978-0-7637-8138-5', '1', 2011, 3,2),
('The Scarlet Letter','0-619-21674-3', '7', 2005, 3.5,4),
('Gone with the Wind','1-931841-62-4', '1', 2002, 3,2),
('Little Women','0-672-31110-0', '2', 1997, 5,2),
('The Complete Poems of Emily Dickinson','0-07-226228-1', '1', 2006, 4, 5)


INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Twain'And
boo.ISBN = '0-201-83595-9'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Carol'And
boo.ISBN = '0-201-00650-2'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Austen'And
boo.ISBN = '0-932633-43-9'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Moor'And
boo.ISBN = '0-936233-05-6'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Dickens'And
boo.ISBN = '0-201-10331-1'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Dickens'And
boo.ISBN = '0-201-11889-0'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Swift'And
boo.ISBN = '1-881526-91-7'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Lee'And
boo.ISBN = '0-9370-7380-6'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Fitzgerald'And
boo.ISBN = '0-932633-39-0'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Twain'And
boo.ISBN = '978-0-7637-8138-5'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Hawthorne'And
boo.ISBN = '0-619-21674-3'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Mitchell'And
boo.ISBN = '1-931841-62-4'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Alcott'And
boo.ISBN = '0-672-31110-0'
INSERT INTO BB_JNC_AuthorBook (Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Dickison'And
boo.ISBN = '0-07-226228-1'

INSERT INTO BB_Owner(LastName, FirstName, MiddleInitials)
Values ('Szanzer','Shana', 'R' )
INSERT INTO BB_Owner(LastName, FirstName, MiddleInitials)
Values ('Jaffe','Chaim', NULL)
INSERT INTO BB_Owner(LastName, FirstName, MiddleInitials)
Values ('Gold','Zahava', 'B' )
INSERT INTO BB_Owner(LastName, FirstName, MiddleInitials)
Values ('Hefter','Malky', NULL )
INSERT INTO BB_Owner(LastName, FirstName, MiddleInitials)
Values ('Hirsh','Avi', NULL)


/*INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (1, 25.00, 35.00, 30)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (2, 20.00, 32.00, 40)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (3, 30.00, 45.00, 55)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (4, 33.20, 47.15, 37)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (5, 36.17, 49.43, 15)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (6, 24.99, 44.99, 23)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (7, 23.55, 35.76, 27)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (8, 17.99, 26.52, 55)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (9, 24.23, 36.09, 43)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (10, 27.32, 39.99, 50)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (11, 21.70, 30.99, 20)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (12, 17.80, 26.99, 33)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (13, 28.20, 40.99, 42)
INSERT INTO BB_Prices(Book_ID, [Wholesale Price], [Retail Price], Quantity)
Values (14, 22.43, 33.99, 13)*/

INSERT INTO BB_Employee(FirstName,LastName, MiddleInitials, Location_ID)
Values ('Hannah', 'Mason', 'D.', 1)
INSERT INTO BB_Employee(FirstName,LastName, MiddleInitials, Location_ID)
Values ('Quincy', 'Adams', NULL, 2)
INSERT INTO BB_Employee(FirstName,LastName, MiddleInitials, Location_ID)
Values ('Mark', 'Callahan', 'P.', 3)
INSERT INTO BB_Employee(FirstName,LastName, MiddleInitials, Location_ID)
Values ('Jane', 'Hawthorne', 'V.', 4)
INSERT INTO BB_Employee(FirstName,LastName, MiddleInitials, Location_ID)
Values ('Jason', 'Richards', NULL, 5)


INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer], Location_ID)
Values ('Stacy', 'Max', NULL,'Y', 1)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Mia', 'Mason', NULL, 'N',1)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Alex', 'Cross', 'D.','Y', 1)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Greg', 'Stiles', NULL,'Y', 1)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Kyle', 'Jones', NULL,'Y', 1)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Xander', 'Grant', 'M.', 'N', 1)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Miles', 'Hank', 'P.', 'Y', 1)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Westly', 'Peters',NULL, 'N',2)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Gordon', 'Ramsey', NULL, 'Y', 2)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Miley', 'Cyrus', 'R.', 'N', 2)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Percy', 'Jackson', NULL, 'N', 2)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Rick', 'Royce', 'D.',  'N',2)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Jack', 'Daniels', NULL, 'Y', 2)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Bill', 'Flint', 'P.', 'N', 2)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Mark', 'Jacobs', NULL, 'Y', 3)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Hannah', 'Brown', NULL, 'N', 3)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Katie', 'Bruekner', NULL, 'N', 3)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Talia', 'Scott', NULL, 'Y', 3)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Josh', 'Betzing', NULL,'N', 3)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Sheldon', 'Cooper', NULL, 'Y', 3)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Gabrielle', 'Moses', NULL, 'N', 4)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Maddie', 'White', NULL, 'N', 4)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Kate', 'Beckett', 'B.', 'Y', 4)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Richard', 'Castle', NULL, 'N', 4)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Ross', 'Geller', NULL, 'Y', 4)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Rachel', 'Green', 'L.', 'N', 4)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Monica', 'Geller', NULL, 'Y', 5)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Joey', 'Tribbiani', 'S.', 'N', 5)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Graham', 'Norton', NULL, 'Y', 5)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Niki', 'Garcia', 'J.', 'Y', 5)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Chris', 'Pratt', NULL, 'N', 5)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Chandler', 'Bing', NULL, 'Y', 5)
INSERT INTO BB_Customer(FirstName,LastName, MiddleInitials, [Loyal Customer],  Location_ID)
Values ('Martha', 'Evans', 'H.', 'N', 5)


INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Stacy Max', '3984 East 34th Street', 'Brooklyn', 'NY', 11230, 1)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Mia Mason', '1058 East 29th Street', 'Brooklyn', 'NY', 11230, 2)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Alex Cross', '2954 Nostrand Avenue', 'Brooklyn', 'NY', 11230, 3)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Greg Stiles', '1060 East 32nd Street', 'Brooklyn', 'NY', 11230, 4)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Kyle Jones', '1342 East 19th Street', 'Brooklyn', 'NY', 11230, 5)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Xander Grant', '1572 East 15th Street', 'Brooklyn', 'NY', 11230, 6)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Miles Hank', '1789 East 21st Street', 'Brooklyn', 'NY', 11230, 7)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Westly Peters', '92 Wall Street Avenue', 'New York', 'NY', 11368, 8)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Gordon Ramsey', '31 Madison Avenue', 'New York', 'NY', 11368, 9)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Miley Cyrus', '45 W 87th Street', 'New York', 'NY', 11368, 10)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Percy Jackson', '73 W 83rd Street', 'New York', 'NY', 11368, 11)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Rick Royce', '56 W 53rd Street', 'New York', 'NY', 11368, 12)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Jack Daniels', '43 W 56rd Street', 'New York', 'NY', 11368, 13)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Bill Flint', '39 W 96th Street', 'New York', 'NY', 11368, 14)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Mark Jacobs', '45 Astoria Boulevard', 'Queens', 'NY',  11101, 15)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Hannah Brown', '10 Beach Channel Drive', 'Queens', 'NY',  11101, 16)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Katie Bruekner', '20 Ditmars Boulevard', 'Queens', 'NY',  11101, 17)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Talia Scott', '13 Flushing Avenue', 'Queens', 'NY',  11101, 18)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Josh Betzing', '15 Main Street', 'Queens', 'NY',  11101, 19)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Sheldon Cooper', '56 Queens Boulevard', 'Queens', 'NY',  11101, 20)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Gabrielle Moses', '12 Administration Hill', 'Bronx', 'NY', 10451, 21)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Maddie White', '1 Asylum Rd', 'Bronx', 'NY', 10451, 22)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Kate Beckett', '3 Erben Ave', 'Bronx', 'NY', 10451, 23)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Richard Castle', '54 Emmet St', 'Bronx', 'NY', 10451, 24)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Ross Geller', '76 Crowninshield St', 'Bronx', 'NY', 10451, 25)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Rachel Green', '91 McGowan St', 'Bronx', 'NY', 10451, 26)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Monica Geller', '39 Honeysuckle Rd ', 'Long Island', 'NY', 11104, 27)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Joey Tribbiani', '11 Love Lane', 'Long Island', 'NY', 11104, 28)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Graham Norton', '17 Magnolia Ave', 'Long Island', 'NY',11104, 29)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Niki Garcia', '82 Mark Twain Lane', 'Long Island', 'NY', 11104, 30)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Chris Pratt', '38 Idle Hour Blvd', 'Long Island', 'NY', 11104, 31)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Chandler Bing', '48 Melville Rd', 'Long Island', 'NY', 11104, 32)
INSERT INTO BB_CustomerAddresses(Name, Street, City, State, Zip, Customer_ID)
Values('Martha Evans', 'Merrick Rd', 'Long Island', 'NY', 11104, 33)

Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2, '1/2/2004', 15.99, 25.99, 1, 6)
Insert into BB_Purchases([Book_ID], [Date Purchased],[Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(3, '10/7/2004', 25.99, 35.99, 1, 2)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(5, '11/30/2004', 22.99, 32.99, 1, 3)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(6, '2/14/2004', 27.99, 37.99, 1, 5)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(7, '4/13/2004', 32.99, 42.99, 1, 6)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(4, '12/20/2004', 29.99, 39.99, 1, 7)
Insert into BB_Purchases([Book_ID], [Date Purchased],[Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(1, '3/2/2004', 19.99, 29.99, 1, 1)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2,' 7/4/2004', 15.99, 25.99, 1, 3)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(14, '3/15/2004', 28.99, 38.99, 1, 7)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(8, '1/10/2004', 31.99, 41.99, 1, 2)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(9, '5/28/2004', 18.99, 28.99, 1, 2)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2,' 7/13/2004', 15.99, 25.99, 1, 3)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(3, '4/7/2004', 30.99, 40.99, 1, 1)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(11, '8/7/2004', 18.99, 28.99, 1, 3)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(13, '10/1/2004', 25.99, 35.99, 1, 4)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(12, '11/19/2004', 17.99, 27.99, 1, 5)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price],Location_ID,Customer_ID)
Values(4, '12/25/2004', 29.99, 30.99,1, 6)


Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(10, '1/2/2004', 26.99, 36.99, 2, 8)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(8, '10/6/2004', 31.99, 41.99, 2, 9)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(9, '1/21/2004', 18.99, 28.99, 2, 10)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2, '2/10/2004', 15.99, 25.99, 2, 11)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(3, '12/17/2004', 30.99, 40.99,2, 12)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(1,' 3/7/2004', 19.99, 29.99, 2, 13)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(13,' 4/19/2004', 25.99, 35.99, 2, 14)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(12, '11/21/2004', 17.99, 27.99, 2, 10)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(4,' 8/22/2004', 29.99, 39.99, 2, 12)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2,' 6/2/2004', 15.99, 25.99, 2, 8)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(3, '10/9/2004', 25.99, 35.99, 2, 8)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(5,' 11/3/2004', 22.99, 32.99, 2, 9)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(6,' 6/14/2004', 27.99, 37.99, 2, 10)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(7, '7/13/2004', 32.99, 42.99,2, 12)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(4,' 12/17/2004', 29.99,39.99, 2, 14)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(1, '3/7/2004', 19.99, 29.99, 2, 11)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(11, '1/8/2004', 18.99, 28.99, 2, 12)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(14,' 3/8/2004', 28.99, 38.99, 2,10)

Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(14,' 1/19/2004', 28.99, 38.99, 3, 15)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(8, '3/6/2004', 31.99, 41.99, 3, 16)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(9,' 5/21/2004', 18.99, 28.99, 3, 17)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2,' 6/10/2004', 15.99, 25.99,3, 18)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(3,' 4/17/2004', 30.99,40.99, 3, 19)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(11,' 8/7/2004', 18.99, 28.99, 3, 17)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(13,' 10/19/2004', 25.99, 35.99,3, 20)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(12,' 11/21/2004', 17.99,27.99, 3, 19)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(4,' 12/22/2004', 29.99,39.99, 3, 15)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2,' 1/2/2004', 15.99,25.99, 3, 16)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2, '10/7/2004', 25.99,35.99, 3, 20)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(5,' 11/30/2004', 22.99, 32.99, 3, 13)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(6,' 2/14/2004', 27.99, 37.99, 3, 15)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(7,' 4/13/2004', 32.99,42.99, 3, 16)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(4,' 12/20/2004', 29.99,39.99, 3, 17)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(1,' 3/2/2004', 19.99,29.99, 3, 18)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2,' 7/4/2004', 15.99,25.99,3, 19)

Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2,' 6/2/2004', 15.99,25.99, 4, 21)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(3,' 10/9/2004', 25.99,35.99,4, 22)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(5,' 11/3/2004', 22.99,32.99, 4, 23)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(6,' 6/14/2004', 27.99,37.99, 4, 25)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(7,' 7/13/2004', 32.99,42.99, 4, 26)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(4,' 12/17/2004', 29.99, 39.99,4, 24)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(10,' 3/7/2004', 19.99,29.99, 4, 26)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(11,' 1/8/2004', 18.99,28.99, 4, 21)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(14,' 3/8/2004', 28.99, 38.99,4, 23)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(14, '1/19/2004', 28.99, 38.99,4, 21)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(8,' 3/6/2004', 31.99,41.99, 4, 22)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price],Location_ID,Customer_ID)
Values(9,' 5/21/2004', 18.99,28.99, 4, 23)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price],Location_ID,Customer_ID)
Values(2,' 6/10/2004', 15.99, 25.99,4, 24)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(3,' 4/17/2004', 30.99, 40.99,4, 21)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price],Location_ID,Customer_ID)
Values(11,' 8/7/2004', 18.99,28.99, 4, 25)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(13,' 10/19/2004', 25.99,35.99, 4, 26)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(12,' 11/21/2004', 17.99,27.99, 4, 23)

Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(14,' 3/15/2004', 28.99,38.99, 5, 27)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(8,' 1/10/2004', 31.99,41.99, 5, 28)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(9,' 5/28/2004', 18.99,28.99, 5, 29)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2,' 7/13/2004', 15.99, 25.99,5, 30)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(3,' 4/7/2004', 30.99,40.99, 5, 31)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(11,' 8/7/2004', 18.99,28.99, 5, 32)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(13,' 10/1/2004', 25.99,35.99, 5, 33)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(12,' 11/19/2004', 17.99, 27.99,5, 28)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(4,' 12/25/2004', 29.99,39.99, 5, 33)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(2,' 6/2/2004', 15.99,25.99, 5, 27)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(3,' 10/9/2004', 25.99,35.99, 5, 28)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(5,' 11/3/2004', 22.99, 32.99, 5, 29)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(6,' 6/14/2004', 27.99,37.99, 5, 28)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(7,' 7/13/2004', 32.99,42.99, 5, 27)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(10, '12/17/2004', 29.99,39.99, 5, 33)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(1,' 3/7/2004', 19.99,29.99, 5, 31)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(11,' 1/8/2004', 18.99,28.99, 5, 32)
Insert into BB_Purchases([Book_ID], [Date Purchased], [Wholesale Price],[Retail Price], Location_ID,Customer_ID)
Values(14,' 3/8/2004', 28.99,38.99, 5, 30)



drop table BB_Purchases
SELECT * from BB_Author
select * from BB_Book
SELECT * from BB_StoreLocation
SELECT * from BB_Owner
SELECT * FROM BB_CustomerAddresses
SELECT * FROM BB_Customer
SELECT * FROM BB_Purchases
SELECT * from BB_Employee

--List all stores with their managers
Select Manager = FirstName + ' ' + lastName, Store=[Store location]
from BB_Owner o 
join BB_StoreLocation l 
on o.Owner_ID = l.OwnerID

--List total wholesale and retail value of the inventory of each store
SELECT l.[Store Location],
       Format(SUM(l.Quantity * p.[Wholesale Price]),'#,###.00' ) AS TotalWholesaleValue,
       Format(SUM(l.Quantity * p.[Retail Price]),'#,###.00') AS TotalRetailValue
FROM BB_Purchases p
JOIN BB_StoreLocation l ON p.Location_ID = l.Location_ID
GROUP BY l.[Store Location];

--List titles and number of copies of all the books across the inventories of all stores.
SELECT Title, [Number of copies] = Quantity
FROM BB_Book b
JOIN BB_StoreLocation l
ON b.Location_ID = l.Location_ID
GROUP BY Title, Quantity;

--Hire a new employee
insert into BB_Employee(FirstName, LastName, MiddleInitials, Location_ID)
values('Camry', 'Jones', 'J.', 1)

--Purchase a new book
insert into BB_Book(Title, ISBN, Edition,[Year], Rating, Location_ID)
Values('The Secret Garden', '0-201-42785-6', 1, 1980, 4, 4)
Insert into BB_Author ( LastName,FirstName, MiddleInitials, Title)
values('Burnett', 'Frances', 'H.', Null)
Insert into bb_Purchases([Book_ID], [Date purchased], [Wholesale Price], [Retail Price], Location_ID, Customer_ID)
Values(15, '12/28/2004', 23.99, 33.99, 4, 20)
insert into BB_JNC_AuthorBook(Author_ID, Book_ID) SELECT aut.Author_ID,
boo.Book_ID FROM BB_Author aut, BB_Book boo WHERE aut.LastName = 'Burnett'And
boo.ISBN = '0-201-42785-6'

select distinct Title, [Wholesale Price], [Retail Price]
from BB_Book b
join BB_Purchases p
on b.Book_ID = p.Book_ID

--List all loyal customers with the titles of the books they purchased over a specified time period
SELECT Distinct Customer = firstName + ' ' + lastName , Title
from BB_Customer c 
join bb_Purchases p
on c.Customer_ID = p.customer_ID
Join BB_Book b
on p.Book_ID = b.Book_ID
where [Loyal Customer] = 'Y'
AND [Date Purchased] > '1/1/2004' AND [Date Purchased] < '6/21/2004'




alter table BB_StoreLocation add [Quantity] int NULL

update  BB_StoreLocation set [Quantity] =10
