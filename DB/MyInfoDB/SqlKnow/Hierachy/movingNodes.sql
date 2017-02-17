
/*	Hierarchical Data
	-------------------------------------------------------------------
	http://blogs.msdn.com/b/manisblog/archive/2007/08/17/sql-server-2008-hierarchyid.aspx
	
Moving Nodes and Subnodes 
	http://sqlblogcasts.com/blogs/simons/archive/2008/03/31/SQL-Server-2008---HierarchyId---How-do-you-move-nodes-subtrees-around.aspx

*/

--	get hid from direct ancestor
	select *, hid.GetAncestor(1) from tbli order by idate desc



--	reparent a node
	DECLARE @EmployeeToMove hierarchyid
	DECLARE @OldParent hierarchyid
	DECLARE @NewParent hierarchyid

	SELECT	@EmployeeToMove = hid	,
			@oldParent = hid.GetAncestor(1)
	FROM	tblI
	where   id = 88				
		
	select	@NewParent = hid
	from	tblI
	where	id = 89		-- jqplot

	
	update	tblI
	set		hid = @EmployeeToMove.GetReparentedValue(@OldParent, @NewParent)
	where	hid = @EmployeeToMove
	
	

--	reparent a subtree

	--DECLARE @OldParent hierarchyid
	--DECLARE @NewParent hierarchyid

	--SELECT @OldParent = hid
	--FROM	tblI
	--WHERE	EmployeeId =  -- Amy

	--SELECT @NewParent = NodeId
	--FROM Employee
	--WHERE EmployeeId = 89 -- Kevin

	--UPDATE tblI
	--set		hid = hid.GetReparentedValue(null, @NewParent)
	--WHERE NodeId.IsDescendantOf(@OldParent) = 1
	--AND EmployeeId <> 46 -- This excludes Amy from the move.
	
