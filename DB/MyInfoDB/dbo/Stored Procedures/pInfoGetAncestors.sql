	
/*	-------------------------------------------------------------------------------------------------------------------------------------
		
		Return all ancestors of a given node
			

		Call	exec dbo.pInfoGetAncestors @Id = 1

		--------------------------------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[pInfoGetAncestors]
	@ID		int = null			,
	@Text	varchar(100) = null	,
	@level		smallint = null
as
set nocount on
	
	select	c.*, c.hid.ToString()		Path	
	from	tblInfoH	c
	  join	tblInfoH	p
		on	c.hid.IsDescendantOf(p.hid)	= 1
	where	(p.id = @ID or p.text = @Text)
	 and	(@level is null or c.Level = p.level + @level)
			

	--  and	(@level is null or hid.GetLevel() = @level)

	/**	Test
		delete from tblInfoH where text like 'Ancestor%'
		declare @id int;
		exec  @id = dbo.pInfoUpdate  @text='AncestorTest';
		print cast(@id as varchar(20));

				exec  @id = dbo.pInfoUpdate  @text='Ancestor0', @parentID = @id;
				print cast(@id as varchar(20));

					exec  @id = dbo.pInfoUpdate  @text='Ancestor1', @parentID = @id;
					print cast(@id as varchar(20));

						exec  @id = dbo.pInfoUpdate  @text='Ancestor2', @parentID = @id;
						print cast(@id as varchar(20));

			select * from tblInfoH

		-- get the node tree of : 
			--	complete hierarchy including itself
				declare @hid int = (select id from tblInfoH where text = 'Ancestor0')
				exec dbo.pInfoGetAncestors @ID = @hid

				exec dbo.pInfoGetAncestors @text = 'Ancestortest'

			--	just the first childs
				exec dbo.pInfoGetAncestors @text = 'Ancestor0', @level=1

	  **/