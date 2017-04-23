
/*	-------------------------------------------------------------------------------------------------------------------------------------
	
	Get Hierarchy of a node or entire Hierarchy

	When wished with parameter @create a node can be created.

	Call		Get item:	
					exec dbo.pInfoH @Name = '2017-04-20'

					exec dbo.pInfoH @Name = '2017-04-22', @create=1


				Get entire Hierarchy
					exec dbo.pInfoH 

				select * from tblI order by idate desc



	select * from tblI
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoH]
	
	@Name			varchar(250) = null	,
	@create			bit = 0					-- optional: when not exist then create the root node

	
as
set nocount on
	
	-- check if an not existant parent node has to be crated

	if @create = 1 
		begin
			-- if @name (date) is null use today
			
			-- get the parent node hid
			declare  @parent hierarchyid = (
				select hid from tblI where name = @name
			)	

			if @parent is null
				begin
				--	----------------------------------------------------------------------------------
				--	No Day Node with the @Name exist
				--	----------------------------------------------------------------------------------
					insert into dbo.tblI	(
						hid, Name, [Key]
					) 
					values	(
						hierarchyid::GetRoot().GetDescendant(
							(	select	max(hid) 
								from	dbo.tblI
								where	hid.GetAncestor(1) = hierarchyid::GetRoot()),
							NULL)	,
							@name, '[day]'
					)
				end
			end

	--	only a node
		select	i.id										,
				i.hid.ToString()			as Hierarchy	,
				i.Level									,
				replicate('     ', i.hid.GetLevel()) + i.Name as VisualPath  ,
				i.Name									,
				i.[Key]									,
				i.Value									,
				i.Url										,
				convert(varchar(20), i.iDate, 120)	iDate
		from	tblI		i
		  join	tbli		p
		   on	p.Name = @Name or p.Name  = null 			-- '2017-04-20'
		 where	i.hid.IsDescendantOf(p.hid)	= 1
		-- where	hid.ToString() like '/297/%'
		order	by i.hid;

		-- select * from tblI

