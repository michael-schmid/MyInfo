
/*	-------------------------------------------------------------------
	Sql Server 20008	HierarchyID Data Type

						Built in functions
					
	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	Terminology
		Leaf, Root, Hierarchy, Ancestor, Descendant, Child, Parent


	Build In Functions

		Get all leafs from a node
			HID.IsDescendantOf(HID) : returns 0 / 1 
		

		return the level from a HierarchyId
			hid.GetLevel()			


		returns the nth ancestor as an hid
		http://technet.microsoft.com/de-de/library/bb677202.aspx
			hid.getAncestor(n)


			Example:
				-- find child roots

		GetReparentedValue(oldValue, newValue)
			http://msdn.microsoft.com/en-us/library/bb677207(v=sql.105).aspx


			select * into tblInfoHSave from tblInfoH
			truncate table tblInfoH

			dbo.pInfo_DemoData


			pInfoGet