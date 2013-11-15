CREATE TABLE [dbo].[tblInfo]
(
	[Id] INT NOT NULL identity PRIMARY KEY, 
    [Text] VARCHAR(1000) NOT NULL, 
    [iDate] DATETIME NULL DEFAULT getdate(), 
    [Pos] hierarchyid(10) 
)
