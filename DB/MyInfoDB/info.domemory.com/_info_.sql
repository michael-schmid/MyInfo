
/*	-------------------------------------------------------------------
	Manche Hierarchical Informations

						Built in functions
					
					truncate table tblI
	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	--	persistence
		select *
		from	tblI 
		order	by id desc



		delete from tblI where id > 2291



	
	--	Create Info

	--	add root item
			declare @id int;
			exec @id = pInfoAdd	@parentId=1,  @name='test', @key='key', @Value='Value', @Url='Url'

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

