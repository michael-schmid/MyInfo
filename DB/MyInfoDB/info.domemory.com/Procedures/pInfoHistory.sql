
/*	-------------------------------------------------------------------------------------------------------------------------------------
	Get information item or list


	Call	


	select * from tblI
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoHistory]
	
as
set nocount on

	select	-- topp 50		
			id							,
			Name						,
			[Key]						,
			Value						,
			Url							,
			convert(varchar(20), iDate, 120)	iDate
	from	tbli
	order	by iDate Desc
	
