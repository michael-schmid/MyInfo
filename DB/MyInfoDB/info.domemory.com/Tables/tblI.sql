CREATE TABLE [dbo].[tblI]
(
	[Id]		INT NOT NULL identity PRIMARY KEY, 
    [iDate]		DATETIME NULL DEFAULT getdate(), 
    [hid]		hierarchyid(10) not null, 
    [Level]		AS hid.GetLevel(), 
	[Name]		VARCHAR(128) NULL, 
    [Key]		VARCHAR(100) NULL, 
    [Value]		varchar(1000) NULL, 
    [Url]		VARCHAR(2000) NULL, 
    [cDate] DATETIME2 NULL
)
