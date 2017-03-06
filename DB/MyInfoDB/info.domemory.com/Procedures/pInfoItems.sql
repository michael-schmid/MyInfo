
/*	-------------------------------------------------------------------------------------------------------------------------------------
	
	Purpose		Retrieve all child items of an node in the hierarchy
	
	Call		Get item:	
					exec dbo.pInfoChilds @Id = 15;

	select * from tblI 
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoChilds](
	@Id				int = null		
)			
as
set nocount on
	
	select	top 50		
			c.id									,
			c.hid.ToString()			Hierarchy	,
			null						Path		,	-- to be implemented : node/node/node
			c.Level									,
			replicate('     ', c.hid.GetLevel()) + c.Name as VisualPath  ,
			c.Name									,
			c.[Key]									,
			c.Value									,	
			c.Url									,
			convert(varchar(20), p.iDate, 120)	iDate
	from	dbo.tblI	c
		join	dbo.tblI	p
		on	p.id = @id
	where	c.hid.IsDescendantOf(p.hid)	= 1

		