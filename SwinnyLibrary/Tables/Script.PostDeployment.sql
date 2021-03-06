﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


IF '$(LoadTestData)' = 'true'

BEGIN

-- Ensure tables are clear before adding test data
DELETE FROM Book;
DELETE FROM Author;
DELETE FROM Student;


-- Inserting Test Data

INSERT INTO Student(StudentID, FirstName, LastName, Email, Mobile) VALUES
('s12345678', 'Fred', 'Flintstone', '12345678@student.swin.edu.au', 040555111),
('s23456789', 'Barney', 'Rubble', '23456789@student.swin.edu.au', 0400555222),
('s34567890', 'Bam-Bam', 'Rubble', '34567890@student.swin.edu.au', 040555333);


INSERT INTO Author(AuthorID, AuthorFirstName, AuthorLastName, AuthorTFN) VALUES
(32567, 'Edgar', 'Codd', '150 111 222'),
(76543, 'Vinton', 'Cerf', '150 222 333'),
(12345, 'Alan', 'Turing', '150 333 444');

INSERT INTO Book(ISBN, Title, YearPublished, AuthorID, StudentID) VALUES
('978-3-16-148410-0', 'Relationships with Databases, the ins and outs.', 1970, 32567, NULL),
('978-3-16-148410-1', 'Normalisation, how to makea database geek fit in.', 1973, 32567, NULL),
('978-3-16-148410-2', 'TCP/IP, The protocol for the masses.', 1983, 76543, NULL),
('978-3-16-148410-3', 'The man, The bombe, and the Enigma.', 1940, 12345, NULL);

END;
