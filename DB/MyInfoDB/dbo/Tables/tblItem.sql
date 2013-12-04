CREATE TABLE [dbo].[tblItem]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(100) NULL, 
    [Value] VARCHAR(MAX) NULL, 
    [iDate] DATETIME2 NULL DEFAULT getdate(), 
    [iUser] VARCHAR(100) NULL
)
