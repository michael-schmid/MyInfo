CREATE TYPE [dbo].[typeInfo] AS TABLE
(
	[Id]		INT 							, 
	Hierarchy	varchar(1000)					,
	Path	    varchar(max)					,
	[Level]		smallint						,
	VisualPath	varchar(max)					,
	[Name]		VARCHAR(128)					, 
    [Key]		VARCHAR(100)					, 
    [Value]		nvarchar(1000)						, 
    [Url]		VARCHAR(2000)					,
	[iDate]		DATETIME						
)
