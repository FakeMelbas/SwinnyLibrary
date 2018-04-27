﻿/*
Deployment script for SwinnyLibrary

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar LoadTestData "true"
:setvar DatabaseName "SwinnyLibrary"
:setvar DefaultFilePrefix "SwinnyLibrary"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
PRINT N'Altering [dbo].[Author]...';


GO
ALTER TABLE [dbo].[Author] ALTER COLUMN [AuthorTFN] NVARCHAR (50) NOT NULL;


GO
/*
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
(32567, 'Alan', 'Turing', '150 333 444');
/*
INSERT INTO Book(ISBN, Title, YearPublished, AuthorID, StudentID) VALUES
('978-3-16-148410-0', 'Relationships with Databases, the ins and outs.', 1970, 32567, NULL),
('978-3-16-148410-1', 'Normalisation, how to makea database geek fit in.', 1973, 32567, NULL),
('978-3-16-148410-2', 'TCP/IP, The protocol for the masses.', 1983, 76543, NULL),
('978-3-16-148410-3', 'The man, The bombe, and the Enigma.', 1940, 12345, NULL);
*/
END;
GO

GO
PRINT N'Update complete.';


GO
