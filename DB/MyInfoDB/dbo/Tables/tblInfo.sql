﻿CREATE TABLE [dbo].[tblInfo]
(
	[Id] INT NOT NULL identity PRIMARY KEY, 
    [Text] VARCHAR(1000) NOT NULL, 
	[Topic] VARCHAR(1000) NULL, 
	[Tags] VARCHAR(1000) NULL, 
    [iDate] DATETIME NULL DEFAULT getdate(), 
    [Pos] hierarchyid(10) 
)
