		
	/*
		Test Runner for the information API
	
		select * from dbo.tblI
	*/	
			print 'Start Testing Info API';
			print '------------------------------------------------------';

			truncate table dbo.tblI;
			
			--	add root item
				declare @id int;
				exec @id = pInfoAdd	 @name='test', @key='key', @Value='Value', @Url='Url'

				-- print cast(@id as varchar(20))

				--	add child item1
					exec pInfoAdd	@parentId=@id,  @name='testChild1'
					exec pInfoAdd	@parentId=@id,  @name='testChild2'
							
			declare @levelChild1 int = (select	hid.GetLevel() 
				from	dbo.tblI
				where	name = 'testChild1'
			);

			if @levelChild1 = 2
				print 'OK Insert child passed'
			else
				print 'NOK Insert Child failed'


		--	add root item
				
				exec @id = pInfoAdd	 @name='keyValueTest';
				
		

				--	add items for key value collection
					exec pInfoAdd	@parentId=4,  @key='key1', @value='value1';
					exec pInfoAdd	@parentId=@id,  @key='key2', @value='value2';
					exec pInfoAdd	@parentId=@id,  @key='key3', @value='value3';
					exec pInfoAdd	@parentId=@id,  @key='key4', @value='value4';
							
			
		
			declare @colItems smallint  = (
					select	count(*)
					from	dbo.tbli
					where	[key] like 'key%' 
					  and	[value] like 'value%'
			);

			if @colItems = 4
				print 'OK Collection with 4 items added';
			else
				print 'NOK Collection items not found';