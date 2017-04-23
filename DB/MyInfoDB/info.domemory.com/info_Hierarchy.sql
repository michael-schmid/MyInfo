
/*	-------------------------------------------------------------------
	
	Complete Hierarchy or parts of it

	--SQL5003.Smarterasp.net

	--------------------------------------------------------------------------------------------------------------------------------------------------------- */


	--	compolete structure
		select	id							,
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


	--	only a node
		select	id							,
				hid.ToString()		Hierarchy	,
				null				Path		,	-- to be implemented : node/node/node
				Level						,
				replicate('     ', hid.GetLevel()) + Name as VisualPath  ,
				Name						,
				[Key]						,
				Value						,
				Url							,
				convert(varchar(20), iDate, 120)	iDate
		from	tblI		i
		where	hid.ToString() like '/297/%'
		order	by hid;