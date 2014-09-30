
/*	-------------------------------------------------------------------------------------------------------------------------------------
		
		Add or update a given information item 
			

		Call		exec dbo.pInfoUpdate  @mode='add', @text='Tasks', @parentID=6

					--	add a root item
						declare @id int;
						exec  @id = dbo.pInfoUpdate  @text='NewRoot';
						print cast(@id as varchar(20));

						--	add child to the root
							exec dbo.pInfoUpdate  @text='NewRoot', @parentID = 20

					select * from tblInfoH order by idate desc

		--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoUpdatee]
	@id				int = null				,
	@Text			varchar(1000) = null	,
	@parentiD		int = null				
as
set nocount on

	
		-- get the parent node hid
		declare  @parent hierarchyid = (select hid from tblInfoH where id = @parentiD)	

		if @parentiD is null
			begin
				insert into dbo.tblInfoH (
					hid, text
				)
				values	(
					hierarchyid::GetRoot().GetDescendant(
						(	select MAX(hid) 
							from	dbo.tblInfoH
							where	hid.GetAncestor(1) = hierarchyid::GetRoot()),
						NULL)	,
						@Text );

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

	
	

