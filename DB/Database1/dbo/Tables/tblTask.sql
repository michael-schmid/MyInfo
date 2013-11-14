CREATE TABLE [dbo].[tblTask]
(
	[Id]			INT NOT NULL  identity(1, 1) PRIMARY KEY, 
    [Name]			VARCHAR(100) NULL, 
    [Description]	VARCHAR(500) NULL, 
    [Status]		NCHAR(10) NULL, 
    [iDate]			DATE NULL DEFAULT getdate() 
)
