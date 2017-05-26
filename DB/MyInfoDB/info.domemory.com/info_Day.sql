
/*	-------------------------------------------------------------------
	
	Get a list of nodes having childs 

	--SQL5003.Smarterasp.net

	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	select	
			id							,
			hid.ToString()		Hierarchy	,
			null				Path		,	-- to be implemented : node/node/node
			Level						,
			replicate('     ', hid.GetLevel()) + Name as VisualPath  ,
			Name						,
			[Key]						,
			Value						,
			Url							,
			convert(varchar(20), iDate, 120)	iDate
	from	tbli
	--where	(id = @id
	--	or	@id is null)	
	order	by hid 



	--	get MyDay Daily Statistic : to know what happened on what day
		
		select	* 
		from	dbo.tblI 
		where	[key] = '[day]'
		order by iDate desc


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


