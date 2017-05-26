
/*	-------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Get iNformation of a particular day

					when the day not exist, create a node for the day					


	Example			usees today when not name parameter
						exec dbo.pInfoDayGet
					uses a particular day
						exec dbo.pInfoDayGet @Name = '2017-04-01'
						exec dbo.pInfoo @Id = 7;


		select * from tblI order by iDate desc

	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoDayGet]
	
	@Name			varchar(1000) = null		
	
as
set nocount on

	-- if @name (date) is null use today
	if @name is null
		set @name = convert(varchar(10), getdate(), 120);
	
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
					@name, 'day'
			)
		end
		
	--	return the day child node with its childs
		select	c.Name					,
				p.id							,
				p.hid.ToString()		Hierarchy	,
				p.Level						,
				replicate('     ', p.hid.GetLevel()) + p.Name as VisualPath  ,
				p.Name						,
				p.[Key]						,
				p.Value						,
				p.Url							,
				convert(varchar(20), p.iDate, 120)	iDate
		from	tblI	p
			left	outer join	
				tblI	c
			on	c.hid = p.hid.GetAncestor(1)
		where	c.name = @Name														-- wished date
		  or	(@name is null and c.Name = convert(varchar(10), getdate(), 120));	-- if omitted then use current date
	


	return SCOPE_IDENTITY()


	

