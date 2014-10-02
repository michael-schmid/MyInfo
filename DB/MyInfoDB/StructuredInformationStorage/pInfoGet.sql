
/*	-------------------------------------------------------------------------------------------------------------------------------------
	Get information item or list


	Call		Get item:	
					exec dbo.pInfoGet @Id = 7;

				Get descentants from an item:
					exec dbo.pInfoGet @parentId = 7;

				Get List 
					exec dbo.pInfoGet

	select * from tblI
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoGet]
	
	@Id				int = null					,
	@Name			varchar(1000) = null		,	-- not yet implemented
	@Key			varchar(1000) = null		,	-- not yet implemented
	@Value			varchar(1000) = null		,	-- not yet implemented
	@ParentId		int = null						-- not yet implemented
as
set nocount on


	select	top 50		
			id							,
			hid.ToString()		Hierarchy	,
			null				Path		,	-- to be implemented : node/node/node
			Level						,
			replicate('     ', hid.GetLevel()) + Name as VisualPath  ,
			Name						,
			[Key]						,
			Value						,
			Url							,
			convert(varchar(20), iDate, 120)	iDate
	from	tbli
	where	(id = @id
		or	@id is null)	
	order	by idate desc


	