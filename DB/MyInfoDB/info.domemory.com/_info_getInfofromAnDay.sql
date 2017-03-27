
/*	-------------------------------------------------------------------
	
	Check what informaiton was stored for a day node

	--SQL5003.Smarterasp.net

	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	select	c.Name					,
			count(p.id) Childs
	from	tblI	p
	  left	outer join	
			tblI	c
	    on	c.hid = p.hid.GetAncestor(1)
	where	c.name = '2017-03-20'
	group	by
			c.Name

