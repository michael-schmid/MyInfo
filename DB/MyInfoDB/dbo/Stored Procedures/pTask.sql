CREATE PROCEDURE [dbo].[pTask]
	@Name			varchar(100) = null	,
	@Description	varchar(1000)= null	,
	@status			varchar(500) = null	,
	@mode			varchar(30) = 'list'
AS
set nocount on

	-- list existing tasks
	--	exec pTask @mode='list'
	if	@mode = 'list'
		begin
			select	* 
			from	tblTask
			where	(@name is null or name = @Name)
		end

	-- add a task
	-- exec pTask @mode='add', @name='gaga', @description='gugus', @status='fettig'
	if	@mode = 'add'
		begin
			insert into tblTask(Name, Description, Status)
			values (@Name, @Description, @status)		
		end

	
RETURN 0
