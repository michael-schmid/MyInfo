
/*	-------------------------------------------------------------------------------------------------------------------------------------
	Maintain Information

	insert into tblInfo(text,  Pos) 
	values ('dddd',  0x)

	select pos.GetAncestor(1) from tblInfo where id = 7
	
	select * from tblInfo order by iDate desc

	truncate table tblInfo
	--	add a new root
		insert into tblInfo(text,  Pos) values ('test', hierarchyid::GetRoot())
		insert into tblInfo(text,  Pos) values ('Sql Server', hierarchyid::GetRoot())


	--	add new information hierarchical
		declare @id int = 8;
		
		exec @id = dbo.pInfo @mode='add', @text='Tasks', @parentID=@id
			exec @id = dbo.pInfo @mode='add', @text='Taskss', @parentID=@id
				exec @id = dbo.pInfo @mode='add', @text='Tasksss', @parentID=@id

		select * from tblInfo order by Idate desc


		select distinct topic from tblInfo 

	--	Sql Server Information
		exec @id = dbo.pInfo @mode='add', @text='Row Constructor', @parentID=15
				exec @id = 	dbo.pInfo @mode='add', @text='How To ', @parentID=15
				exec @id = 	dbo.pInfo @mode='add', @text='How To ', @parentID=15
					exec dbo.pInfo @mode='add', @text='How To ', @parentID=@id

	--	get all informations
		exec dbo.pInfo @mode='list'
		select * from tblInfo for xml auto

		, @parentID=6, @createdID = @ID
		select @ID

	--	get info with information collection of the 1st level
		exec dbo.pInfo @mode='list', @id=1

	--	get the sql
		select * from tblInfo for xml raw,  root('info')
	--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfo]
	@id				int = null				,
	@Text			varchar(1000) = null		,
	@Topic			varchar(1000) = null		,
	@Tags			varchar(1000) = null		,
	@mode			varchar(30) = 'list'	,
	@parentiD		int = null				,
	@createdID		int = null output
as
set nocount on

	--	list existing tasks
	--	exec pTask @mode='list'
	if	@mode = 'list'
		begin
			select	
					top 50		
					id			,			
					Text		,
					Topic		,
					Tags		,
					convert(varchar(20), iDate, 120)	iDate
			from	tblInfo
			--where	(id = @id
			--	or	@id is null)	
			order	by idate desc

		end

	-- add a task
	
	-- exec pInfo @mode='add', @name='gaga', @description='gugus', @status='fettig', @parentID = 2
	-- select * from tblInfo
	if	@mode = 'add'
		begin
			declare @parent hierarchyid, @child hierarchyid, @newNode hierarchyid, @newID int

			select @parent = pos from tblInfo where id = @parentID
			-- select @parent

			select @child = max(pos) from tblInfo
			where	pos.GetAncestor(1) = @parent
			-- select @child

			--	add the new node
				set @newNode = @parent.GetDescendant(@child, null)
				insert into tblInfo(text,  Pos, Topic, Tags) 
				--- output inserted.Id					--	into @newID
				values (@text,   @newNode, @Topic, @Tags)
			
			return SCOPE_IDENTITY()

		end

	

