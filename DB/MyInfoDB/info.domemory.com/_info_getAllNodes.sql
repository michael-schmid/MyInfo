
/*	-------------------------------------------------------------------
	
	Get a list of nodes having childs 

	--SQL5003.Smarterasp.net

	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	select	c.Name					,
			count(p.id) Childs
	from	tblI	p
		left	outer join	
			tblI	c
		on		c.hid = p.hid.GetAncestor(1)
		group	by
			c.Name

	

		select	i.id, 
				i.hid.ToString()			as Hierarchy,
				i.Level				,
				REPLICATE('     ', i.level) + Name as Text
		from	tblI		i
		where	hid.ToString() like '/297/%'
		order	by hid;