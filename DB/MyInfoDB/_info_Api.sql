/*	-------------------------------------------------------------------------------------------

	Information Storage DB API

	------------------------------------------------------------------------------------------	**/


	--	get all information
		select *, hid.ToString()
		from	dbo.tblInfoH


	--	get a particular level
		exec dbo.pInfoGetLevel		-- Root
		exec dbo.pInfoGetLevel  1


	--	get direct descendants 
		exec dbo.pInfoGetAncestors @text = 'Ancestor0', @level=1


	--	add information
		exec dbo.pInfoUpdate  @mode='add', @text='Tasks'
		select * from tblInfoH order by idate desc

			/*

			GetReparentedValue

			
			declare cursor 

			select	* 
			from	tblInfoH		h
			  join	tblInfo			i
			    on	h.text = i.topic
			

			-- delete 
			--		select * 
			from	tblInfo
			where	text = 'sdsadsadsa'

			order by iDate desc


			exec @id = 	dbo.pInfo @mode='add', @text='How To ', @parentID=15

			insert into tblInfoH(text) select text from tblInfo 

			delete from tblInfo where text = 'sdsadsadsa'

			select * from tblInfo order by id desc


			truncate table tblInfoH
			select * from tblInfoH where text like 'Browser Link'

			Visual Studio 2013
				Browser Link
					MSDN Article: http://www.asp.net/visual-studio/overview/2013/using-browser-link 		
					Multiple Browser Refresh possible	
					Utilizes SignalR	
					Refresh Browser Content: 
						Alt + Ctrl + Enter



						drop table tblInfoH

		*/