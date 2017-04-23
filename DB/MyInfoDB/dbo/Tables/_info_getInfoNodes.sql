
/*	---------------------------------------------------------------------------------------------------------------------------------------------------------
	
	Get an information with its childs (Hierarchy of one node)

	--SQL5003.Smarterasp.net

	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	--	base table
		select *
		from	tblI 
		order	by id desc


	--	Child nodes of an node
		select	c.id				as ParentId,
				c.Name				ParentName ,
				p.id				ChildId	,
				p.Name				ChildName	,
				p.Value							,
				p.Url							,
				p.iDate							,
				p.Level			
		from	tblI	p
			left	outer join	
				tblI	c
			on		c.hid = p.hid.GetAncestor(1)
		where	c.id = 2		

	