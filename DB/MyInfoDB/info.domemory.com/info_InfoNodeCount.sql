
/*	---------------------------------------------------------------------------------------------------------------------------------------------------------
	
	Information Node with count of childs

	--SQL5003.Smarterasp.net

	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	--	base table
		select *
		from	tblI 
		order	by id desc



	--	Count of child 
		select	c.ID					,					
				c.Name					,
				count(p.id) Childs
		from	tblI	p
		  left	outer join	
				tblI	c
		  on	c.hid = p.hid.GetAncestor(1)
		group	by
				c.Name					,
				c.Id