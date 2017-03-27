
/*	-------------------------------------------------------------------
	
	Get a list of collected information ordered by date

	--SQL5003.Smarterasp.net

	--------------------------------------------------------------------------------------------------------------------------------------------------------- */

	--	base table
		select *
		from	tblI 
		order	by id desc


	--	with procedure
		exec dbo.pInfoHistory


		