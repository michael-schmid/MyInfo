
/*	-------------------------------------------------------------------------------------------------------------------------------------
	
	Description:	Return MyDay Statistic

	Example			exec dbo.pInfoDays

				select * from tblI order by iDate desc

	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoDays]
	@Name			varchar(1000) = null		
as
set nocount on

	
		select	c.Id					, 
				c.Name					,
				count(p.id) Childs
		from	tblI	p
		  left	outer join	
				tblI	c
			on		c.hid = p.hid.GetAncestor(1)
		where	c.[key] = '[day]'
			group	by
				c.Name, c.id
		order	by
				c.id desc