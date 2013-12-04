
/*	-------------------------------------------------------------------------------------------------------------------------------------
	Purpose				Insert new name value pars in tblItem

	Maintain Items						truncate table tblItem

	--	get Date
		select * from dbo.tblItem;

	--	insert data
			insert into dbo.tblItem
						(Name, value) 
				values	('testName',  'TestValue')
	
	--------------------------------------------------------------------------
	API
	---
		exec dbo.pItemInsert @name='Gugus', @value='gaga'
	
	
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pItemInsert]
(
	@Name			varchar(500) = null		,
	@Value			varchar(30) = 'list'	,
	@User			varchar(100) = null
)
as
set nocount on

	insert into dbo.tblItem
					(Name, value) 
			values	(@name,  @value)
	
	

	

