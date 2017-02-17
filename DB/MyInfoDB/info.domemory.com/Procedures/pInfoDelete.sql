
/*	-------------------------------------------------------------------------------------------------------------------------------------
	Delete Information Items


	Important:	this only deletes the information node: neither parents nor childs will be deleted.

	Call		exec dbo.pInfoDelete @id=4

	select * from dbo.tblI where id = 332
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoDelete] (
	@id		varchar(1000) = null		
)
as
set nocount on

	delete 
	from	tblI
	where	id = @id;


	

