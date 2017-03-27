
/*	-------------------------------------------------------------------
	
	Get an information with its childs

	--SQL5003.Smarterasp.net

	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	--	base table
		select *
		from	tblI 
		order	by id desc


	--	with procedure
		exec dbo.pInfoHistory



			select	c.Name					,
					count(p.id) Childs
			from	tblI	p
			 left	outer join	
					tblI	c
			 on		c.hid = p.hid.GetAncestor(1)
		
			 group	by
					c.Name