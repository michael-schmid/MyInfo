
/*	-------------------------------------------------------------------------------------------------------------------------------------
		
		Add or update a given information item 
			

		Call		exec dbo.pInfoUpdate  @mode='add', @text='Tasks', @parentID=6

					--	add a root item
						exec dbo.pInfoUpdate  @text='NewRoot'

						--	add child to the root
							exec dbo.pInfoUpdate  @text='NewRoot', @parentID = 20

					select * from tblInfoH order by idate desc

		--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoUpdate]
	@id				int = null				,
	@Text			varchar(1000) = null	,
	@parentiD		int = null				,
	@createdID		int = null output
as
set nocount on

	
		-- get the parent node hid
		declare  @parent hierarchyid = (select hid from tblInfoH where id = @parentiD)	

		if @parentiD is null
			begin
				insert into dbo.tblInfoH (
					hid, text
				)
				values	(HIERARCHYID::GetRoot(), @Text );
			end
		else
			begin
				--	get
					declare @lastChild hierarchyid = (
						select	max(hid) 
						from	tblInfoH
						where	hid.GetAncestor(1) = @parent
					);
				--	
					declare @newChild hierarchyid = @parent.GetDescendant(@lastChild, NULL);
		
					insert into tblInfoH(text, hId) 
					--- output inserted.Id					--	into @newID
					values (@Text,   @newChild)
			end

		--	reuturn created id
			return SCOPE_IDENTITY()

	
	

