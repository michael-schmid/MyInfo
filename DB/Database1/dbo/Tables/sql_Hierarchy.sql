
/*	Hierarchical Data
	-------------------------------------------------------------------
	http://blogs.msdn.com/b/manisblog/archive/2007/08/17/sql-server-2008-hierarchyid.aspx
	
Moving Nodes and Subnodes 
	http://sqlblogcasts.com/blogs/simons/archive/2008/03/31/SQL-Server-2008---HierarchyId---How-do-you-move-nodes-subtrees-around.aspx

*/

truncate table dbo.tblInfo;


DECLARE @xml XML

SET @xml = '
<Root>
	<Info Text="User Interface">
		<Info Text="Sql Server" />
		 <Info Text="XML Support" />
		 <Info Text="Output clause" />
	</Info>
	<Info Text="Webservice">
		<Info Text="Odate" />
		 <Info Text="Asp.net Webapi" />
		 <Info Text="Node.js" />
	</Info>
	<Info Text="Database">
		<Info Text="Sql Server" />
		 <Info Text="XML Support" />
		 <Info Text="Output clause" />
		 <Info Text="Output clause" />
        <Info Text="How To">
            <Info Text="Move HirarchyID" />
        </Info>
        <Info Text="Rowset Constructor">
			<Info Text="insert into table(id, name) values (''id1'', ''id2'')" />
			<Info Text="Process multiple in one transaction" />
		</Info>
	</Info>
 </Root>';

-- set @xml = '
-- <Root>
--	 <tblInfo Text="User Interface" Level="0" />
--	<tblInfo Text="Webservice" Level="0" />
--	<tblInfo Text="Database" Level="0" />
--	<tblInfo Text="Sql Server" Level="1" />
--	<tblInfo Text="Odate" Level="1" />
--	<tblInfo Text="Sql Server" Level="1" />
--	<tblInfo Text="XML Support" Level="1" />
--	<tblInfo Text="Asp.net Webapi" Level="1" />
--	<tblInfo Text="XML Support" Level="1" />
--	<tblInfo Text="Output clause" Level="1" />
--	<tblInfo Text="Node.js" Level="1" />
--	<tblInfo Text="Output clause" Level="1" />
--	<tblInfo Text="Output clause" Level="1" />
--	<tblInfo Text="How To" Level="1" />
--	<tblInfo Text="Move HirarchyID" Level="2" />
--	<tblInfo Text="Rowset Constructor" Level="1" />
--	<tblInfo Text="Process multiple in one transaction" Level="2" />
--</Root>
--';
	
with CTE_ITEMS ([HId], [Infos], [Text], [Path]) 
AS 
( 
    SELECT  
        hierarchyid::GetRoot() as [HId], 
        VIRT.node.query('./*') as [Infos], 
        VIRT.node.value('@Text', 'nvarchar(500)') as [Text], 
        CAST('/' as nvarchar(max)) as [Path] 
    FROM @xml.nodes('/Root/*') as VIRT(node) 
    UNION ALL 
    SELECT  
        hierarchyid::Parse([HId].ToString() + 
	--	WTF: Is that expression ??????????????????????????????????????????????????????????????????????
		VIRT.node.value('1+count(for $a in . return $a/../*[. << $a])', 'varchar(10)') + '/'), 
    --	??????????????????????????????????????????????????????????????????????????????????????????????
		VIRT.node.query('./*'),  
        VIRT.node.value('@Text', 'nvarchar(500)'), 
        [Path] +  
            CASE [Path] WHEN '/' THEN '' ELSE + '/' END +  
            VIRT.node.value('@Text', 'nvarchar(max)') 
    FROM  
    CTE_ITEMS CROSS APPLY Infos.nodes('./*') as VIRT(node) 
) 
--	select * from tblInfo; 
--	insert the items from the cte	
	insert into dbo.tblInfo(Pos, Text)

	SELECT [HId].ToString(),[Text]
	-- ,[Path],[HId].GetLevel() 
	FROM CTE_ITEMS 
	ORDER BY [HId] 

--	show the results
	select	pos.ToString() Pos, [Text],[Pos].GetLevel() Level
	from	dbo.tblInfo

--	get xml result
	select	[Text], [Pos].GetLevel() Level
	from	tblInfo
	for xml auto 
