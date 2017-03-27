
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
	@Url			varchar(1000) = null		,
	@ParentId		int = null
as
set nocount on

	
		
		if @parentiD is null
			begin
				-- no parent id create on the root
				declare @root hierarchyid = hierarchyid::GetRoot().GetDescendant(
						(	select	max(hid) 
							from	dbo.tblI
							where	hid.GetAncestor(1) = hierarchyid::GetRoot()),
						NULL)	

				update	tblI
				set		Name = coalesce(@Name, Name)		,
						[Key] = coalesce(@Key, [Key])		,
						Value = coalesce(@Value, Value)		,
						Url = coalesce(@Url, Url)			,
						hid = @root							,
						cDate = getdate()
				where	id = @id
			end
		else
			begin
				--	get the parent node hid
					declare  @parent hierarchyid = (select hid from tblI where id = @parentiD)	

				--	get
					declare @lastChild hierarchyid = (
						select	max(hid) 
						from	tblI
						where	hid.GetAncestor(1) = @parent
					);
				--	
					declare @newChild hierarchyid = @parent.GetDescendant(@lastChild, NULL);
		
			
				--	update information
					update	tblI
					set		Name = coalesce(@Name, Name)		,
							[Key] = coalesce(@Key, [Key])		,
							Value = coalesce(@Value, Value)		,
							Url = coalesce(@Url, Url)			,
							hid = @newChild						,
							cDate = getdate()
					where	id = @id
			end



			/**	-----------------------------------------------------------------------------------------------------------

				select * from tblI order by iDate desc

				-----------------------------------------------------------------------------------------------------------	**/

