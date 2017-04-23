
/*	-------------------------------------------------------------------
	
	Check what informaiton was stored for a day node

	--SQL5003.Smarterasp.net

	--------------------------------------------------------------------------------------------------------------------------------------------------------- */
	-- counts
		select	c.Name					,
				count(p.id) Childs
		from	tblI	p
		  left	outer join	
				tblI	c
			on	c.hid = p.hid.GetAncestor(1)
		where	c.name = '2017-03-22'
		group	by
				c.Name
		
		
	--	Query the hierarchy
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
		
				

	--	
		select	c.Name					,
				p.*
		from	tblI	p
		  left	outer join	
				tblI	c
			on	c.hid = p.hid.GetAncestor(1)
		where	c.name = '2017-03-22'
		

	--	get information, when needed create the day
		-- today
			exec dbo.pInfoDayGet
		--	uses a particular day
			exec dbo.pInfoDayGet @Name = '2017-04-01'


	--	review all day entries
		select *
		from	tbli 
		where	[key] like 'day'
		order	by
				idate desc
		

	--	add information to a day:
		declare @parentId int;
		set @parentId = (select id from tbli where name = '2017-04-01')
		exec pInfoAdd	@parentId=@parentId,  @name='testChild1'


