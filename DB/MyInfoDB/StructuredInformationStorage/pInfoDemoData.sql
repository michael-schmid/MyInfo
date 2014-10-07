		
	/*	--------------------------------------------------------------------------------------------------------------

		Create Demo Data

		exec dbo.pInfoGet

		--------------------------------------------------------------------------------------------------------------- */
			
	create procedure dbo.pInfo_DemoData
	as

	--	create demo data
		
		truncate table tblI

		declare @id int;
		exec @id = dbo.pInfoAdd	 @name='Softare Management'						-- , @key='key', @Value='Value', @Url='Url'


		-- print cast(@id as varchar(20))

		--	add child item1
			
		
			declare @l2_1 int; exec @l2_1 = pInfoAdd	@parentId=@id,  @name='Software Deployment'
				
				exec pInfoAdd	@parentId=@l2_1,  @key='Packages', @Value='-'
				exec pInfoAdd	@parentId=@l2_1,  @key='Applications', @Value='-'
				exec pInfoAdd	@parentId=@l2_1,  @key='Programs', @Value='-'
				exec pInfoAdd	@parentId=@l2_1,  @key='Web Applications', @Value='-'

			exec pInfoAdd	@parentId=@id,  @name='User Assignment'
			declare @iid int; exec @iid = pInfoAdd	@parentId=@id,  @name='Licence Management'
				exec pInfoAdd	@parentId=@iid,  @name='Reclaim Automation'
