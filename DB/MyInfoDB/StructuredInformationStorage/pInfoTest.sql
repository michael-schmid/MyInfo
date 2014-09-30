		
	/*	--------------------------------------------------------------------------------------------------------------

		Test Runner for the information API
	
		select * from dbo.tblI
		--------------------------------------------------------------------------------------------------------------- */
			
	set nocount on;
	print 'Start Testing Info API';
	print '------------------------------------------------------';

	--	clean up test items
		delete	from dbo.tbli
		where	name like 'test%'
			or	[key] like 'test%'


	-----------------------------------------------------------------------------------------------
	print '***	Create Root Information with Childs information'
	-----------------------------------------------------------------------------------------------
			
	--	add root item
		declare @id int;
		exec @id = dbo.pInfoAdd	 @name='testInfo', @key='key', @Value='Value', @Url='Url'

		-- print cast(@id as varchar(20))

		--	add child item1
			exec pInfoAdd	@parentId=@id,  @name='testChild1'
			exec pInfoAdd	@parentId=@id,  @name='testChild2'
							
		declare @levelChild1 int = (select	hid.GetLevel() 
			from	dbo.tblI
			where	name = 'testChild1'
		);

	--	test result
		if @levelChild1 = 2
			print '	OK		Insert child passed'
		else
			print 'NOK			Insert Child failed'

	-----------------------------------------------------------------------------------------------
	print '***	Create KeyValue Collection for an information'
	-----------------------------------------------------------------------------------------------	
	--	add root item
		exec @id = pInfoAdd	 @name='keyValueTest';
		
		--	add items for key value collection
			exec pInfoAdd	@parentId=@id,  @key='testkey1', @value='value1';
			exec pInfoAdd	@parentId=@id,  @key='testkey2', @value='value2';
			exec pInfoAdd	@parentId=@id,  @key='testkey3', @value='value3';
			exec pInfoAdd	@parentId=@id,  @key='testkey4', @value='value4';
		
		declare @colItems smallint  = (
				select	count(*)
				from	dbo.tbli
				where	[key] like 'testkey%' 
					and	[value] like 'value%'
		);

	--	test result
		if @colItems = 4
			print '	OK		Collection with 4 items added';
		else
			print 'NOK			Collection items not found';




	-------------------------------------------------------------------------------------------------
	print '***	Update information';

	-- select * from tblI order by idate desc
		--	add root item
			declare @updateId int;
			exec @updateId = dbo.pInfoAdd		@Name='testInfoUpdate', @Key='key', @Value='Value', @Url='Url'

		--	Update the item: only possible to update : Name, Key, Value, Url
			exec dbo.pInfoUpdate	@id = @updateId, 
									@Name = 'testupdatedInfoUpdate', @Key = 'updatedKey', @Value = 'updatedValue', @Url = 'updatedUrl'

		--	get the updated records 
			declare @updateinfo as typeInfo;

			insert into @updateinfo
						exec dbo.pInfoGet @id=@updateId;

		
			declare @updateStatus varchar(3) = (
					select  case
						when	Name =  'testupdatedInfoUpdate'	
						  and	Value = 'updatedValue'
						  and	[Key] ='updatedKey'
						  and	Url = 'updatedUrl'
						then 'OK'
					else 'NOK' end Status
					from	tbli
					where id = @updateId
			);

		if @updateStatus = 'OK'
			print '	OK		Updated properly Name, Value, Key, Url.'
		else
			print 'NOK			Data different then updated!'

	-------------------------------------------------------------------------------------------------
	print '***	Reparent Information';


	-------------------------------------------------------------------------------------------------
	print '***	Get Information Item';
	
	declare @searchInfo int = (
		select id from tblI where name = 'testInfo'
	);
	
	declare @info as typeInfo;

	insert into @info
	exec dbo.pInfoGet @id=@searchInfo;



	--	Test Output	
		if (select count(*) from @info) = 1
			print '	OK		Get Information item';
		else
			print 'NOK			No item retrieved';

	-------------------------------------------------------------------------------------------------
	print '***	Get Information List';

		declare @infoList as typeInfo;
	
		insert into @infoList
			exec dbo.pInfoGet;
	
		if (select count(*) from @infoList) > 1
			print '	OK		Get more then one item';
		else
			print 'NOK			No items returned';
				-- exec dbo.pInfoGet

	-------------------------------------------------------------------------------------------------
	print '***	Get Information List of a particular node (descendants)';

	declare @searchId int = (
		select id from tblI where name = 'testInfo'
	);
	--	exec dbo.pInfoGet @parentID = @searchId;
		print 'NOK			Not implemented';
	
	




	print '	NOK		Not implemented';



	-------------------------------------------------------------------------------------------------
	print '***	Delete information';
	
	--	add info which then is deleted
		declare @deletInfoId int;
		exec @deletInfoId = dbo.pInfoAdd	@name='testInfoDelete', 
											@key='key', @Value='Value', @Url='Url'
	
	-- get count for before delete
		declare @countBeforeDelete int = (
			select count(*)from tblI 
		);

	--	delete created items
		exec dbo.pInfoDelete @id=@deletInfoId


	--	test result
		if (select count(*) from dbo.tblI) = @countBeforeDelete -1
			and (select count(*) from dbo.tblI where name = 'testInfoDelete') = 0
			print '	OK		Only created test item was deleted.';
		else
			print '	NOK		Eihter item was not deleted or more than one item affected.';

