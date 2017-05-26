
/*	-------------------------------------------------------------------------------------------------------------------------------------
	Maintain Information

	Storage			select	* 
					from	dbo.tblI 
					order	by 
							iDate desc

					

	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoAdd]
	
	@Name			varchar(1000) = null		,
	@Key			varchar(1000) = null		,
	@Value			varchar(1000) = null		,
	@Url			varchar(1000) = null		,
	@parentiD		int = null					,
	@createdID		int = null output
as
set nocount on


	/*	-------------------------------------------------------------------------------------------
			truncate table dbo.tblI;

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

			where	name = 'testChild1'

			if @levelChild1 = 1
				print 'Insert child passed'
			else
				print 'Insert Child failed'

		-------------------------------------------------------------------------------------------*/

		-- get the parent node hid
		declare  @parent hierarchyid = (
			select hid from tblI where id = @parentiD
		)	

		if @parentiD is null
			begin
			--	----------------------------------------------------------------------------------
			--	No Parent Node exist: create a new root node
			--	----------------------------------------------------------------------------------
				insert into dbo.tblI	(
					hid, Name, [Key], Value, Url
				) 
				values	(
					hierarchyid::GetRoot().GetDescendant(
						(	select	max(hid) 
							from	dbo.tblI
							where	hid.GetAncestor(1) = hierarchyid::GetRoot()),
						NULL)	,
						@name, @key, @Value, @Url
				)
			end
		else
			begin
				--	----------------------------------------------------------------------------------
				--	Parent Node exist: create a child node in the structure with parent id 
				--	----------------------------------------------------------------------------------
				--	get
					declare @lastChild hierarchyid = (
							select	max(hid) 
							from	dbo.tblI
							where	hid.GetAncestor(1) = @parent
);
				--	
					declare @newChild hierarchyid = @parent.GetDescendant(@lastChild, NULL);
					declare @outputInfo  table (
							[Id]		INT, 
							[iDate]		varchar(24) , 
							[hid]		varchar(300) , 
							VisualPath	varchar(300)	,
							[Level]		smallint, 
							[Name]		VARCHAR(128) NULL, 
							[Key]		VARCHAR(100) NULL, 
							[Value]		varchar(1000) NULL, 
							[Url]		VARCHAR(2000) NULL
							
					)
					 -- exec dbo.pInfoo @Id = 7;

					-- Error when @newChild is null: print cast(@newChild as varchar(100));

					insert into dbo.tblI	(
						hid, Name, [Key], Value, Url
					) 
					output	inserted.id							,
							inserted.hid.ToString()				,
							inserted.Level						,
							null								,	-- // Visual path omited but remain for the structure
							inserted.Name						,
							inserted.[Key]						,
							inserted.Value						,
							inserted.Url							,
							convert(varchar(20), inserted.iDate, 120)	iDate
					into @outputINfo (id, hid, Level, VisualPath, Name, [Key], [Value], [Url], iDate)
					values (
						@newChild, @name, @key, @Value, @Url
					)
					-- return the added information
					select	* from @outputInfo; 
			end

	
	return SCOPE_IDENTITY()


	

