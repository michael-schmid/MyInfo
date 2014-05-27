
/*	-------------------------------------------------------------------------------------------------------------------------------------
		
		Return a particular level of information
			

		Call	exec dbo.pInfoGetLevel 
		--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoGetLevel]
	
	@level		smallint = 0
as
set nocount on
	
	select	*
	from	tblInfoH
	where	hid.GetLevel() = @level

