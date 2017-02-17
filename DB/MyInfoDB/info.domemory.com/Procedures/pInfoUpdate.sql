
/*	-------------------------------------------------------------------------------------------------------------------------------------
	Update existing Information
	
	Call		exec dbo.pInfoUpdate @					

	Testing		pInfoTest
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoUpdate]
	
	@Id				int							,	-- mandatory for updating the information
	@Name			varchar(1000) = null		,
	@Key			varchar(1000) = null		,
	@Value			varchar(1000) = null		,
	@Url			varchar(1000) = null		
as
set nocount on

	update	tblI
	set		Name = @Name		,
			[Key] = @Key			,
			Value = @Value		,
			Url = @Url	
	where	id = @id

	

	

