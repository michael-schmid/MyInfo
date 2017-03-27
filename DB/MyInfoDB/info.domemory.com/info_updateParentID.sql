
/*	-------------------------------------------------------------------
	
	Change the parentID of an node (move the node to another node)


	Goal: reasign the parentId of an node



	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	--	base table
		select *
		from	tblI 
		order	by id desc


	--	with procedure
		exec dbo.pInfoHistory

		exec dbo.pInfoUpdate @id=2347, @ParentId=2343

		exec pInfoDelete @id=2350


		--	manual update 
		----------------------------------------------------------------------------------------
			declare @parentId int = 2342;
			declare @id int = 2341;

			--	get the parent node hid
					declare  @parent hierarchyid = (select hid from tblI where id = @parentiD)	

			--	get
				declare @lastChild hierarchyid = (
					select	max(hid) 
					from	tblI
					where	hid.GetAncestor(1) = @parent
				);
			--	
				declare @newChild hierarchyid = @parent.GetDescendant(@lastChild, NULL);
		
				print 'New HierarchyId: ' + cast(@parent as varchar(200))
			
				--	update information
					update	tblI
					set		
							hid = @newChild		,
							cDate = getdate()
					where	id = @id