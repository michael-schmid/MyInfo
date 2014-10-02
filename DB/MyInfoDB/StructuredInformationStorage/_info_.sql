
/*	-------------------------------------------------------------------
	Manche Hierarchical Informations

						Built in functions
					
					truncate table tblI
	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	--	persistence
		select *
		from	tblI 
		order	by id desc

	--	test 
		exec dbo.pInfo_Test


	--	type for testing
		declare @infos as typeInfo
		select * from @infos