
/*	-------------------------------------------------------------------------------------------------------------------------------------
	Get information item or list


	Call		Get item:	
					exec dbo.pInfoo @Id = 7;

				Get	root items (no parent information)	
					exec dbo.pInfoo 

	select * from tblI
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoo]
	
	@Id				int = null		
	
as
set nocount on

	-- select * from tblI

			select	p.id							,
					p.hid.ToString()		Hierarchy	,
					p.Level						,
					replicate('     ', p.hid.GetLevel()) + p.Name as VisualPath  ,
					p.Name						,
					p.[Key]						,
					p.Value						,
					p.Url							,
					convert(varchar(20), p.iDate, 120)	iDate
			from	tblI	c
		  join	tblI	p
			on	c.hid.IsDescendantOf(p.hid)	= 1
		where	(c.id = @id  and	 c.Level <= p.level + 1)				-- only child items from the first level
		  or	(@id is null and	p.level = 1 and c.Level = 1)		-- when no id is given return the root
		


	/*
		--	display an item and its direct descendants
			select	--c.*, c.hid.ToString()		Path	, 
					p.*, p.hid.ToString()
			from	tblI	c
			  join	tblI	p
				on	c.hid.IsDescendantOf(p.hid)	= 1
			where	(c.id = 7)
			 and	 c.Level <= p.level + 1
	*/

		-- select * from tbli