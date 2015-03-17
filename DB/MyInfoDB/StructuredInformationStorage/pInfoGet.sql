
/*	-------------------------------------------------------------------------------------------------------------------------------------
	Get information item or list


	Call		Get item:	
					exec dbo.pInfoGet @Id = 7;

				Get descentants from an item:
					exec dbo.pInfoGet @parentId = 7;

					
					exec dbo.pInfoGet @parentId = null;


				Get List 
					exec dbo.pInfoGet

	select * from tblI
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoGet]
	
	@Id				int = null					,
	@Name			varchar(1000) = null		,	-- not yet implemented
	@Key			varchar(1000) = null		,	-- not yet implemented
	@Value			varchar(1000) = null		,	-- not yet implemented
	@ParentId		int			  = null		,	-- not yet implemented
	@view			varchar(50) = 'hirar'
as
set nocount on

	-- provide the last 50 inforamtion of a particular information node
	if @view = 'hirar'
		begin
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
			order	by hid 
		end

	-- return a plain list of information (sorted iDate desc)
	-- to display the journal of added information
	if @view = 'list'
		begin
			
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
			order	by iDate Desc
		end


	