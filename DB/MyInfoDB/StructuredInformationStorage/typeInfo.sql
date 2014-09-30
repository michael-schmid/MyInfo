CREATE TYPE [dbo].[typeInfo] AS TABLE
(
	[Id]		INT 							, 
	[Level]		smallint						,
	[Name]		VARCHAR(128)					, 
    [Key]		VARCHAR(100)					, 
    [Value]		NCHAR(1000)						, 
    [Url]		VARCHAR(100)					,
	[iDate]		DATETIME						
)
