--------------------------------------------------------------------------------------------------------------
/* Final Project - Library Management System Project
   Author: Jurijs Grigorjevs
*/


/* Create db_library database*/
CREATE DATABASE db_library;
GO

USE db_library;
GO

/* Create tbl_library_branch table with branchID-primary key, branchName and branchAddress columns */
CREATE TABLE tbl_library_branch (
	branchID INT PRIMARY KEY  NOT NULL IDENTITY(1,1),
	branchName VARCHAR(50) NOT NULL,
	branchAddress VARCHAR(255) NOT NULL
);

/* Create tbl_borrower table with cardID-primary key, borrowerName, borrowerAddress and borrowerPhone columns */
CREATE TABLE tbl_borrower (
	cardNo INT PRIMARY KEY NOT NULL,
	borrowerName VARCHAR(50) NOT NULL,
	borrowerAddress VARCHAR(255) NOT NULL,
	borrowerPhone VARCHAR(50) NOT NULL
);

/* Create tbl_publisher table with publisherName-primary key, publisherAddress and publisherPhone columns */
CREATE TABLE tbl_publisher (
	publisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	publisherAddress VARCHAR(255) NOT NULL,
	publisherPhone VARCHAR(50) NOT NULL
);

/* Create tbl_books table with bookID-primary key, bookTitle and publisherName-foreign key columns */
CREATE TABLE tbl_books (
	bookID INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	bookTitle VARCHAR(50) NOT NULL,
	publisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES tbl_publisher(publisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

/* Create tbl_book_authors table with bookID-foreign key and authorName columns */
CREATE TABLE tbl_book_authors (
	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	authorName VARCHAR(50) NOT NULL
);

/* Create tbl_book_copies table with bookID-foreign key, branchID-foreign key and number_of_copies */
CREATE TABLE tbl_book_copies (
	bookID INT NOT NULL FOREIGN KEY REFERENCES tbl_books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);

/* Create tbl_book_loans table with bookID-foreign key, branchID-foreign key, cardNo-foreign key, dateOut and dateDue columns */
CREATE TABLE tbl_book_loans (
	bookID INT  NOT NULL FOREIGN KEY REFERENCES tbl_books(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	branchID INT  NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	cardNo INT NOT NULL FOREIGN KEY REFERENCES tbl_borrower(cardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	dateOut VARCHAR(50) NOT NULL,
	dateDue VARCHAR(50) NOT NULL
);


----------- Populate the tables in the database -----------------------------------------------------------------------------------

/* Populate the tbl_library_branch table */
INSERT INTO tbl_library_branch 
	(branchName, branchAddress)
	VALUES
	('Sharpstown', '160 Buckingham Palace Road, London, SW1W9UD'),
	('Dundee', 'The Wellgate, Dundee, DD11DB'),
	('Arthurstone', '5 Arthurstone Terrace, Dundee, DD46RT'),
	('Coldside', '150 Strathmartine Road, Dundee, DD37SE'),
	('Blackness', '225 Perth Road, Dundee, DD21EJ'),
	('Lochee', 'High Street, Lochee, DD23AU')
;
SELECT * FROM tbl_library_branch;


/* Populate the tbl_borrower table */
INSERT INTO tbl_borrower 
	(cardNo, borrowerName, borrowerAddress, borrowerPhone)
	VALUES
	(10, 'Leonard M Smith', '2-3 Dudhope Terrace, Ballumbie DD36HG', '01382322026'),
	(13, 'Angela Roadley', '84 Victoria Road, Dundee DD12NY', '01382226227'),
	(14, 'Tara Ander', '1A Wellington Street, Dundee DD12QA', '01382202238'),
	(12, 'Mary Luckie', '90 Albert Street, Ballumbie DD46QH', '01382721494'),
	(15, 'John Graw', '1 Baffin Street, Ballumbie DD46EZ', '01382457449'),
	(11, 'Agnes Lean', '17 Baffin Street, Dundee DD46HB', '01382450760'),
	(16, 'Margaret Carron', '105 Arbroath Rd, Ballumbie DD46HS', '01382461993'),
	(17, 'Frank Cuish', '187 Princes Street, Dundee DD46DQ', '01382526184')
;
SELECT * FROM tbl_borrower;


/* Populate the tbl_publisher table */
INSERT INTO tbl_publisher 
	(publisherName, publisherAddress, publisherPhone)
	VALUES
	('Charlesbridge', '9 Galen Street Watertown, MA  02472 USA', '8002253214'),
	('Little Tiger Group', '189 Munster Road, London SW66AW', '02073856333'),
	('DK Children', '8 Viaduct Gardens, London SW117BW', '02070103000'),
	('Comma Press', '113 Pollard Street, Manchester M47JA', '07792564747'),
	('Flying Eye Books', '27 Westgate Street, London TA14EY', '02070334430'),
	('Zed Books', '17 Oval Way, London SE115RR', '02037525830'),
	('Yale University Press', '47 Bedford Square, London WC1B3DP', '02070794900'),
	('Claret Press', '51 Iveley Road, London SW40EN', '02076220436'),
	('Kogan Page', '45 Gee Street, London EC1V3RS', '02072780433'),
	('Fledgling Press', '1 Milton Road, Edinburgh EH153', '01316572818')
;
SELECT * FROM tbl_publisher;


/* Populate the tbl_books table */
INSERT INTO tbl_books 
	(bookTitle, publisherName)
	VALUES
	('The Lost Tribe', 'Charlesbridge'),
	('Charlotte Says', 'Little Tiger Group'),
	('The History of Information', 'DK Children'),
	('The Well of Trapped Words', 'Comma Press'),
	('Whirligig', 'Fledgling Press'),
	('Bandoola: The Great Elephant Rescue', 'Flying Eye Books'),
	('Atlas of AI', 'Yale University Press'),
	('Black Tea', 'Claret Press'),
	('United Queerdom', 'Zed Books'),
	('Positively Purple', 'Kogan Page'),
	('The War on Disabled People', 'Zed Books'),
	('The UN At War', 'Yale University Press'),
	('Murder Ink', 'Kogan Page'),
	('Thirteen Months of Sunrise', 'Comma Press'),
	('Sabriel', 'Fledgling Press'),
	('The Outsiders', 'Flying Eye Books'),
	('My So-Called Bollywood Life', 'Little Tiger Group'),
	('Patron Saints of Nothing', 'Little Tiger Group'),
	('Isaac Newton and Gravity', 'Yale University Press')
;
SELECT * FROM tbl_books;


/* Populate the tbl_book_authors table */
INSERT INTO tbl_book_authors 
	(bookID, authorName)
	VALUES
	(100, 'Christine Taylor-Butler'),
	(101, 'Alex Bell'),
	(102, 'Chris Haughton'),
	(103, 'Sema Kaygusuz'),
	(104, 'Andrew James Greig'),
	(105, 'William Grill'),
	(106, 'Kate Crawford'),
	(107, 'Stephen Morris'),
	(108, 'Dan Glass'),
	(109, 'Kate Nash')
;
SELECT * FROM tbl_book_authors;


/* Populate the tbl_book_copies table */
INSERT INTO tbl_book_copies 
	(number_of_copies, bookID, branchID)
	VALUES
	(17 ,100, 1),
	(21 ,101, 2),
	(14 ,103, 1),
	(6 ,104, 3),
	(9 ,107, 5),
	(8 ,102, 4),
	(12 ,109, 6),
	(25 ,105, 4),
	(17 ,108, 5),
	(9 ,106, 1),
	(13 ,102, 1),
	(18 ,106, 3),
	(7 ,108, 4),
	(15 ,104, 2),
	(10 ,109, 6),
	(14 ,100, 5),
	(8 ,101, 3),
	(6 ,103, 2),
	(23 ,107, 5),
	(27 ,105, 4)
;
SELECT * FROM tbl_book_copies;


/* Populate the tbl_book_loans table */
INSERT INTO tbl_book_loans 
	(bookID, branchID, cardNo, dateOut, dateDue)
	VALUES
	(101, 1, 11, '19/06/2024','19/07/2024'),
	(108, 2, 17, '19/06/2024','19/07/2024'),
	(104, 1, 14, '19/06/2024','19/07/2024'),
	(107, 3, 17, '18/06/2024','18/07/2024'),
	(102, 5, 14, '18/06/2024','18/07/2024'),
	(109, 4, 15, '18/06/2024','18/07/2024'),
	(105, 6, 12, '17/06/2024','17/07/2024'),
	(108, 4, 17, '17/06/2024','17/07/2024'),
	(106, 5, 16, '17/06/2024','17/07/2024'),
	(102, 1, 10, '16/06/2024','16/07/2024'),
	(106, 4, 11, '16/06/2024','16/07/2024'),
	(108, 6, 17, '16/06/2024','16/07/2024'),
	(104, 5, 10, '15/06/2024','15/07/2024'),
	(109, 2, 14, '15/06/2024','15/07/2024'),
	(100, 4, 15, '15/06/2024','15/07/2024'),
	(101, 4, 15, '14/06/2024','14/07/2024'),
	(107, 3, 14, '14/06/2024','14/07/2024'),
	(105, 2, 14, '14/06/2024','14/07/2024')
;
SELECT * FROM tbl_book_loans;


--------------------------------------------------------------------------------------------------------------------------------
USE db_library;
GO

/* A query that returns all book titles and author names.*/
SELECT * FROM ((tbl_book_loans FULL OUTER JOIN tbl_borrower ON tbl_book_loans.cardNo = tbl_borrower.cardNo) 
FULL OUTER JOIN tbl_books ON tbl_book_loans.bookID = tbl_books.bookID)

-----------------------------------------------------------------------------------------------------------------------------------
/*  Stored procedures that will ask each of the following questions:
A. How many copies of the book called "The Lost Tribe" does the library branch called "Sharpstown" own?
B. How many copies of the book called "The Lost Tribe" does each library branch own?
C. Get the names of all borrowers who do not have any books checked out.
*/
-------------------------------------------------------------------------------------------------------------------------------------
/* Create stored procedures - A. How many copies of the book called "The Lost Tribe" does the library branch called "Sharpstown" own?
(version 1 of 2)
*/
-------------------------------------------------------------------------------------------------------------------------------------
USE db_library;
GO

/* Create stored procedures dbo.copies_of_the_book_The_Lost_Tribe_in_the_Sharpstown_library_v1 */
CREATE PROCEDURE dbo.copies_of_the_book_The_Lost_Tribe_in_the_Sharpstown_library_v1 
    @bookTitle varchar(70) = 'The Lost Tribe', 
    @branchName varchar(70) = 'Sharpstown'

AS
BEGIN
    SELECT 
        copies.branchID AS [Branch ID], 
        branch.branchName AS [Branch Name],
        copies.number_of_copies AS [Number of Copies],
        book.bookTitle AS [Book Title]
        FROM tbl_book_copies AS copies
        INNER JOIN tbl_books AS book ON copies.bookID = book.bookID
        INNER JOIN tbl_library_branch AS branch ON copies.branchID = branch.branchID
        WHERE book.bookTitle = @bookTitle AND branch.branchName = @branchName;
    END


/*Execute the stored procedure dbo.copies_of_the_book_The_Lost_Tribe_in_the_Sharpstown_library_v1 */
EXECUTE dbo.copies_of_the_book_The_Lost_Tribe_in_the_Sharpstown_library_v1;

---------------------------------------------------------------------------------------------------------------------------------------
/* Create stored procedures - A. How many copies of the book called "The Lost Tribe" does the library branch called "Sharpstown" own?
(version 2 of 2)
*/
---------------------------------------------------------------------------------------------------------------------------------------
USE db_library;
GO

/* Create stored procedures dbo.copies_of_the_book_The_Lost_Tribe_in_the_Sharpstown_library_v2 */
CREATE PROCEDURE dbo.copies_of_the_book_The_Lost_Tribe_in_the_Sharpstown_library_v2
    @bookTitle VARCHAR(70), 
    @branchName VARCHAR(70)

AS
BEGIN
    DECLARE @errorString VARCHAR(100)
    DECLARE @results INT

    SET @errorString = 'There are no copies of "' + @bookTitle + '" found at the ' + @branchName + ' library.'

		BEGIN TRY
			SELECT 
				@results = COUNT(*)
				FROM tbl_book_copies AS copies
				INNER JOIN tbl_books AS book ON copies.bookID = book.bookID
				INNER JOIN tbl_library_branch AS branch ON copies.branchID = branch.branchID
				WHERE book.BookTitle = @bookTitle AND branch.branchName = @branchName;

        IF @results = 0
			BEGIN
				/* logic to follow if this condition is true */
				RAISERROR(@errorString, 5, 1)
				RETURN
			END
        ELSE IF @results > 0
			BEGIN
				SELECT
					copies.branchID AS [Branch ID], 
					branch.branchName AS [Branch Name],
					copies.number_of_copies AS [Number of Copies],
					book.bookTitle AS [Book Title]
					FROM tbl_book_copies AS copies
					INNER JOIN tbl_books AS book ON copies.bookID = book.bookID
					INNER JOIN tbl_library_branch AS branch ON copies.branchID = branch.branchID
					WHERE book.bookTitle = @bookTitle AND branch.branchName = @branchName
					;
			END
    END TRY

		BEGIN CATCH
			/* some logic to follow if any errors occur */
			SET @errorString = ERROR_MESSAGE()
			RAISERROR (@errorString, 5, 1)
		END CATCH
END

/*Execute the stored procedure dbo.copies_of_the_book_The_Lost_Tribe_in_the_Sharpstown_library_v2 */
EXECUTE dbo.copies_of_the_book_The_Lost_Tribe_in_the_Sharpstown_library_v2 
    @bookTitle = 'The Lost Tribe', 
    @branchName = 'Sharpstown';

-------------------------------------------------------------------------------------------------------------------------
/* Create stored procedures - B. How many copies of the book called "The Lost Tribe" does each library branch own? */
------------------------------------------------------------------------------------------------------------------------
USE db_library;
GO

/* Create stored procedures dbo.copies_of_the_book_The_Lost_Tribe_each_library */
CREATE PROCEDURE dbo.copies_of_the_book_The_Lost_Tribe_each_library
(@bookTitle varchar(70) = 'The Lost Tribe')

AS
BEGIN
	SELECT copies.branchID AS [Branch ID], branch.branchName AS [Branch Name],
	   copies.number_of_copies AS [Number of Copies],
	   book.bookTitle AS [Book Title]
	   FROM tbl_book_copies AS copies
	   INNER JOIN tbl_books AS book ON copies.bookID = book.bookID
	   INNER JOIN tbl_library_branch AS branch ON copies.branchID = branch.branchID
	   WHERE book.bookTitle = @bookTitle
	   ; 
	END



/*Execute the stored procedure dbo.copies_of_the_book_The_Lost_Tribe_each_library */
EXECUTE dbo.copies_of_the_book_The_Lost_Tribe_each_library

-------------------------------------------------------------------------------------------------------------------------
/* Create stored procedures - C. Get the names of all borrowers who do not have any books checked out. */
------------------------------------------------------------------------------------------------------------------------
USE db_library;
GO

/* Create stored procedures dbo.names_of_all_borrowers_who_do_not_have_any_books_checked_out */
CREATE PROCEDURE dbo.names_of_all_borrowers_who_do_not_have_any_books_checked_out

AS
BEGIN
    SELECT tbl_borrower.borrowerName AS [Borrower Name] 
		FROM tbl_borrower
		WHERE NOT EXISTS 
        ( SELECT * 
          FROM tbl_book_loans
          WHERE tbl_book_loans.cardNo = tbl_borrower.cardNo)
		;
	END


/* Execute the stored procedure dbo.names_of_all_borrowers_who_do_not_have_any_books_checked_out*/
EXECUTE dbo.names_of_all_borrowers_who_do_not_have_any_books_checked_out;

