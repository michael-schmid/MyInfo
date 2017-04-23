
/*	-------------------------------------------------------------------
	Manche Hierarchical Informations

						Built in functions
					
					truncate table tblI
	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	--	persistence
		select *
		from	tblI 
		order	by idate desc

			
	--	GET info by name
		exec dbo.pInfoo @name = '2017-04-01';

		exec dbo.pInfoo @name = 'Bootstrap';

		exec dbo.pInfoo @name = 'Javascript';



		declare @name varchar(250) = '2017-04-01'; 
		declare @id int = null;

			select	p.id							,
					p.hid.ToString()		Hierarchy	,
					p.Level						,
					replicate('     ', p.hid.GetLevel()) + p.Name as VisualPath  ,
					p.Name						,
					p.[Key]						,
					p.Value						,
					p.Url							,
					convert(varchar(20), p.iDate, 120)	iDate
			from	tblI	c
		  join	tblI	p
			on	c.hid.IsDescendantOf(p.hid)	= 1
		where	((c.id = @id  and	 c.Level <= p.level + 1)				-- only child items from the first level
		  or	(@id is null and	p.level = 1 and c.Level = 1))		-- when no id is given return the root
		  and   ( c.name = @name or @name is null) 

	

	--	Get complete from a node
		
		
		declare @name varchar(250) = '2017-04-01'; 
		declare @id int = null;

			select	p.id							,
					p.hid.ToString()		Hierarchy	,
					p.Level						,
					replicate('     ', p.hid.GetLevel()) + p.Name as VisualPath  ,
					p.Name						,
					p.[Key]						,
					p.Value						,
					p.Url							,
					convert(varchar(20), p.iDate, 120)	iDate
			from	tblI	c
		  join	tblI	p
			on	c.hid.IsDescendantOf(p.hid)	= 1
		where	(c.id = 2)


	--	Create Info Hierarchy
		-------------------------------------------------------------------------------------------------------------------------
		exec dbo.pInfoH 
		exec dbo.pInfoH @name='2017-04-20'
		exec dbo.pInfoH @name='2017-04-21'

		--	root
			delete from tbli where name = '2017-04-20';
			declare @id int;
			exec @id = dbo.pInfoAdd	@name='2017-04-20', @key='[date]' 

			--	child
				exec dbo. pInfoAdd	@parentId=@id,  @name='Kochen', @Value='19:30 - 20:00 Currywurst mit Klöpfer, Baguette'
				exec dbo. pInfoAdd	@parentId=@id,  @name='Kochen', @Value='19:30 - 20:00 Currywurst mit Klöpfer, Baguette'


			delete from tbli where name = '2017-04-21';
			exec @id = dbo.pInfoAdd	@name='2017-04-21', @key='[date]' 

			--	child
				exec dbo. pInfoAdd	@parentId=@id,  @name='Kochen', @Value='06:20 - 07:00 Fahrrad zu UBS'
				exec dbo. pInfoAdd	@parentId=@id,  @name='Kochen', @Value='17:30 - 18:00 Fahrrad Nach hause fahren'
				exec dbo. pInfoAdd	@parentId=@id,  @name='Kochen', @Value='18:15 - 19:45 Einkaufen mit Ibeth und Isa in Rheinfelden'
				exec dbo. pInfoAdd	@parentId=@id,  @name='Kochen', @Value='19:45 - 20:15 Currywurst mit Klöpfer, Baguette'
				exec dbo. pInfoAdd	@parentId=@id,  @name='Kochen', @Value='20:15 - 22:00 Lets Dance mit den Kindern angeschaut, Isa Bett fertig'
				exec dbo. pInfoAdd	@parentId=@id,  @name='Kochen', @Value='23:00 - 01:30 domemory: Hiery Sql Procedures'




	--	add root item
			declare @id int;
			exec @id = pInfoAdd	@parentId=1,  @name='test', @key='key', @Value='Value', @Url='Url'

			
			exec dbo.pInfoAdd	@name='test', @key='key', @Value='Value', @Url='Url'

			--	add child item1
				exec pInfoAdd	@parentId=@id,  @name='testChild1'
				exec pInfoAdd	@parentId=@id,  @name='testChild2'
							

		select	* 
		from	dbo.tblI
		
		order	by 
				idate desc

		

	--	Change Info
		
			select	id, 
					REPLICATE('     ', hid.GetLevel()) + Name as Text
			from	tblI
			order	by hid;


			DECLARE @infoMove			hierarchyid
			DECLARE @oldParent		hierarchyid
			DECLARE @newParent		hierarchyid

			SELECT	@infoMove	= hid	,
					@oldParent	= hid.GetAncestor(1)
			FROM	tblI
			where   id = 88				
		
			select	@NewParent = hid
			from	tblI
			where	id = 89	

	
			update	tblI
			set		hid = @infoMove.GetReparentedValue(@OldParent, @NewParent)
			where	hid = @infoMove
	


	--	Retrieve Information
		select	*, hid.ToString()
		from	tblI
		order	by
				idate desc

		--	Get item:	
			exec dbo.pInfoGet @Id = 15, @parentId = 15


			--	Get descentants from an item:
				exec dbo.pInfoChilds @Id = 15;


			-- ALL ROOT ELEMENTS					
				exec dbo.pInfoGet @parentId = null;



			--	Get List 
				exec dbo.pInfoGet

			--	Get Journal
				exec dbo.pInfoGet @view='list'

