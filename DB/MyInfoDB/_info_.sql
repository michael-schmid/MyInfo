/*

		Information Storage


**/


	select * from tblInfo order by idate desc
	select * from tblItem 


	--	Data API
		
		--	get all
			exec dbo.pInfo  @mode='list'

		--	set information
			exec dbo.pInfo @mode='add', @text='Tasks', @parentID=6


	-- Hierarchical
		
		exec dbo.pInfoGetLevel 
		exec dbo.pInfoGetLevel  1


		--	add root level
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