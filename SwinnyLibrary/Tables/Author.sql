﻿CREATE TABLE [dbo].[Author]
(
	[AuthorID] INT NOT NULL,
	[AuthorFirstName] NVARCHAR(50) NOT NULL,
	[AuthorLastName] NVARCHAR(50) NOT NULL,
	[AuthorTFN] NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Author PRIMARY KEY (AuthorID)
)
