
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




