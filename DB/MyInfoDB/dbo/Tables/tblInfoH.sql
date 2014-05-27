CREATE TABLE [dbo].[tblInfoH]
(
	[Id] INT NOT NULL identity PRIMARY KEY, 
    [Text] VARCHAR(1000) NOT NULL, 
    [iDate] DATETIME NULL DEFAULT getdate(), 
    [hid] hierarchyid(10) 
)
