
/*	-------------------------------------------------------------------

	Generate Hierarchical Data from XML				: Important Only use for data staging, beccause the idate information get lot

	Sql Server Informations

	Source		Generate the XML from existing tblInfo to get the hierarchical data 
				select * from tblInfo

				select	distinct text Name, Topic, Tags, iDate
				from	tblInfo info
				for xml auto

	Result		select * from tblInfoH


*/

declare @xml xml



set @xml = '
<Root>
	<info Name="Various">
	<info Name="&quot;string@find&quot;.split(&quot;@&quot;)[0] === &quot;string&quot;;&#xA;&quot;string@find&quot;.split(&quot;@&quot;)[1] === &quot;find&quot;;&#xA;&quot;string@find&quot;.split(&quot;@&quot;)[2] === undefined;&#xA;&#xA;" Topic="Javascript" Tags="String Ops: Split" iDate="2014-02-12T07:01:33.790" />
<info Name="(object instanceof HTMLElement) === true" Topic="Javascript" Tags="How to check Dom Element" iDate="2014-03-24T08:42:48.343" />
<info Name=".before(content [,content])&#xA;" Topic="jQuery" Tags="Inserting DOM Elements" iDate="2014-02-25T01:56:59.150" />
<info Name=".pop removes the last item " Topic="Javascript " Tags="Array" iDate="2014-02-25T08:11:04.630" />
<info Name=".pull-right" Topic="Bootstrap" Tags="right alignment" iDate="2014-02-17T08:05:43.877" />
<info Name=".splice removes items from an index" Topic="Javascript " Tags="Array" iDate="2014-02-25T08:11:16.853" />
<info Name="// Template tag for the helper function: {{&gt;~format(Name, &quot;upper&quot;)}}&#xA;&#x9;&#x9;&#x9;$.views.helpers({&#xA;&#x9;&#x9;&#x9;&#x9;format: function (val, format)&#xA;&#x9;&#x9;&#x9;&#x9;{&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;var ret;&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;switch (format)&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;{&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;case &quot;upper&quot;:&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;return val.toUpperCase();&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;case &quot;lower&quot;:&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;&#x9;return val.toLowerCase();&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;}&#xA;&#x9;&#x9;&#x9;&#x9;}&#xA;&#x9;&#x9;&#x9;});" Topic="JSRender" Tags="Example Helper Function" iDate="2014-02-15T23:36:40.097" />
<info Name="&lt;a href=&quot;http://lostechies.com/derickbailey/2012/11/01/javascript-unit-tests-jasmine-vs-mocha/&quot;&gt;Jasmine vs. Mocha &lt;/a&gt;" Topic="Javascript" Tags="Testing" iDate="2014-02-12T22:59:33.967" />
<info Name="&lt;a href=&quot;http://lostechies.com/derickbailey/2014/01/03/semantics-modules-and-testing-why-and-how-i-test-internal-components-not-private-methods/&quot;&gt;Testing private functionality: &lt;/a&gt;" Topic="Javascript" Tags="Testing" iDate="2014-02-12T22:58:51.957" />
<info Name="&lt;a href=&quot;http://msdn.microsoft.com/en-us/library/jj851203(v=vs.103).aspx&quot;&gt;MSDN: Creating Database Unit Tests&lt;/a&gt;" Topic="SSDT" Tags="Unit Testing" iDate="2014-02-13T01:32:20.137" />
<info Name="&lt;a href=&quot;http://rzrsharp.net/2012/08/01/client-side-testing-insanity.html&quot;&gt;Client Side Testing Insanity&lt;/a&gt;&#xA;&#xA;&lt;a href=&quot;http://singlepageappbook.com/maintainability3.html&quot;&gt;Test Description for SPA&lt;/a&gt;&#xA;&#xA;" Topic="Testing: Mocha" Tags="Resources" iDate="2014-02-14T06:58:19.300" />
<info Name="&lt;a href=&quot;http://rzrsharp.net/2012/08/01/client-side-testing-insanity.html&quot;&gt;Client Side Testing Insanity&lt;/a&gt;&#xA;&#xA;&lt;a href=&quot;http://singlepageappbook.com/maintainability3.html&quot;&gt;Test Description for SPA&lt;/a&gt;&#xA;&#xA;" Topic="Testing: Mocha" Tags="Resources" iDate="2014-02-16T07:16:08.850" />
<info Name="&lt;a href=&quot;http://www.info.domemory.net/&quot; &gt;testlink&lt;/a&gt;" iDate="2014-02-10T22:15:26.427" />
<info Name="&lt;a href=&quot;https://github.com/clubajax/mocha-bootstrap/blob/origin/index.html&quot;&gt;Github project for using Instructions for different Test Frameworks&lt;/a&gt;" Topic="Javascript Unit Testing" Tags="AMD Modules" iDate="2014-02-15T05:13:45.453" />
<info Name="&lt;a href=&quot;https://github.com/jrburke/requirejs/wiki/Test-frameworks&quot;&gt;Instructions for different Test Frameworks&lt;/a&gt;" Topic="Javascript Unit Testing" Tags="AMD Modules" iDate="2014-02-15T05:05:12.610" />
<info Name="&lt;dl&gt;&lt;dt&gt;&lt;dd&gt;" Topic="HTML" iDate="2014-05-17T23:48:12.040" />
<info Name="{{:index}} Tag to display the index from the current templated data item." Topic="JSRender" Tags="Get Data Item Number" iDate="2014-02-15T16:17:45.937" />
<info Name="2nd SSSIS Toolbox&#xA;http://www.jamesserra.com/archive/2013/01/ssis-2012-empty-toolbox/" Topic="SSIS" Tags="Empty Toolbox" iDate="2014-03-07T03:42:35.897" />
<info Name="add()" Topic="jQuery" Tags="Inserting DOM Elements" iDate="2014-02-25T02:46:47.573" />
<info Name="Assertion Library: should.js, expect.js, chai.js&#xA;Expression languages" Topic="Testing" Tags="Javacript" iDate="2014-02-18T06:22:14.180" />
<info Name="Bootstrap" iDate="2014-05-19T15:31:48.137" />
<info Name="catches errors early, enable easy refactoring, " Topic="Testing" Tags="Why?" iDate="2014-02-15T13:18:07.447" />
<info Name="Change default connection timeout of 30 sec: Connection Properties in app.config to enable long running tests" Topic="Unit Test" Tags="SSDT" iDate="2014-05-08T15:02:59.897" />
<info Name="change the web port for iis_express" Topic="IIS" Tags="Visual Studio" iDate="2014-02-27T06:23:15.943" />
<info Name="Child item of bootstrap" iDate="2014-05-19T15:39:10.120" />
<info Name="Child item of bootstrap" iDate="2014-05-19T15:40:00.690" />
<info Name="Child item of bootstrap" iDate="2014-05-19T15:42:51.163" />
<info Name="Child item of bootstrap" iDate="2014-05-19T15:42:55.490" />
<info Name="child of hallo" iDate="2014-05-19T15:43:33.410" />
<info Name="Config globals:  mocha.setup({globals: [var1, 0]} to ignore var1 and 0 as global vars" Topic="Mocha" Tags="Global Leak" iDate="2014-03-25T03:44:52.763" />
<info Name="content = html, dom element, array of element, jquery object&#xA;" Topic="jQuery" Tags="Inserting DOM Elements" iDate="2014-02-25T01:57:01.087" />
<info Name="Created Database Test for issuing isac function: set and reset parameter" Topic="MySDS" Tags="Issue" iDate="2014-02-11T01:55:51.300" />
<info Name="Cross origin ressource sharing" Topic="Cors" iDate="2014-02-09T22:15:42.490" />
<info Name="dafsdfasd" iDate="2013-11-16T16:16:58.290" />
<info Name="dafsdfasd" iDate="2013-11-16T16:17:01.660" />
<info Name="dafsdfasd" iDate="2013-11-16T16:17:05.680" />
<info Name="dafsdfasd" iDate="2013-11-16T16:17:08.290" />
<info Name="describe -&gt; it -&gt; expect; vs. TDD Style" Topic="Testing" Tags="BDD Style" iDate="2014-02-18T06:27:47.840" />
<info Name="dfadklfjkd" iDate="2014-05-19T15:33:05.513" />
<info Name="dfadsfad" iDate="2014-02-10T22:21:39.647" />
<info Name="dfadsfad" iDate="2014-02-10T22:25:29.830" />
<info Name="dfasdfas" iDate="2014-02-10T22:37:23.553" />
<info Name="dfasdkjfksd" iDate="2014-02-10T22:28:29.027" />
<info Name="dfdsfds" iDate="2013-11-16T16:16:58.293" />
<info Name="dfdsfds" iDate="2013-11-16T16:17:01.660" />
<info Name="dfdsfds" iDate="2013-11-16T16:17:05.683" />
<info Name="dfdsfds" iDate="2013-11-16T16:17:08.287" />
<info Name="dflsakjdfkd" iDate="2014-02-10T22:03:37.273" />
<info Name="dhehehe" iDate="2014-02-10T22:27:05.270" />
<info Name="DJKFSDKLFJKD" iDate="2013-11-16T06:54:29.880" />
<info Name="DJKFSDKLFJKD" iDate="2013-11-16T06:54:29.883" />
<info Name="dlfldskf" iDate="2014-02-10T22:25:55.410" />
<info Name="dsfads" Topic="rwqer" Tags="dafdsfa" iDate="2014-02-14T08:37:56.170" />
<info Name="dsfakjkdfs" iDate="2014-02-10T22:35:10.543" />
<info Name="dsfasdfasdf" iDate="2014-02-10T22:35:54.670" />
<info Name="dsjafkd" iDate="2014-02-10T22:41:50.867" />
<info Name="Editor and Builder for Bootsrap: http://www.bootply.com/" Topic="Bootstrap" iDate="2014-05-17T23:45:18.983" />
<info Name="Enable Sql Server Logging: Outputtable sysssislog.&#xA;http://sqlwithmanoj.wordpress.com/2011/06/15/logging-in-ssis-using-sql-server-log-provider/" Topic="SSIS" Tags="Logging" iDate="2014-03-07T03:42:05.323" />
<info Name="error-handling service: Errorception" Topic="Error Handling" Tags="Javascript" iDate="2014-02-09T13:10:22.857" />
<info Name="error-handling service: Errorception" Topic="Error Handling" Tags="Javascript" iDate="2014-02-09T13:10:57.067" />
<info Name="first entry over the web" iDate="2014-02-09T08:23:06.217" />
<info Name="Fixed i-SAC Issue with System Rule Reset: Unlarified change of behavior. Created new tests. Verified isac changes. &#xA;Corrected and documented Report Downloas Option&#xA;Started report group and group member reports for mysds" Topic="Worklog" Tags="2014-01-11" iDate="2014-02-11T21:41:06.727" />
<info Name="Global Error Handling with event hanlder: window.onError = function(err){return true});" Topic="Error Handling" Tags="Javascript" iDate="2014-02-09T13:11:18.560" />
<info Name="Greate REsource: http://bradsruminations.blogspot.ch/search/label/CROSS%20APPLY&#xA;" Topic="Sql Server" Tags="Cross Apply" iDate="2014-02-21T07:55:38.370" />
<info Name="gugus" iDate="2014-02-10T22:26:46.103" />
<info Name="hallo" iDate="2014-02-10T22:26:12" />
<info Name="Hallo" iDate="2014-05-19T15:35:28.433" />
<info Name="Handle Async erros only in the callback handler" Topic="Javascript" iDate="2014-02-09T13:06:49.003" />
<info Name="hdldld" iDate="2014-02-10T22:34:37.137" />
<info Name="Heute " iDate="2013-11-16T16:16:58.460" />
<info Name="Heute eingegeben" iDate="2013-11-16T16:17:01.660" />
<info Name="Heute eingegeben" iDate="2013-11-16T16:17:05.870" />
<info Name="Heute eingegeben" iDate="2013-11-16T16:17:08.467" />
<info Name="http://css-tricks.com/utilizing-the-underused-but-semantically-awesome-definition-list/" Topic="HTML" Tags="Definition List" iDate="2014-05-17T23:50:15.397" />
<info Name="http://dailyjs.com/2012/02/23/chai/" Topic="Testing" Tags="Chai.js" iDate="2014-02-18T06:22:35.377" />
<info Name="http://encosia.com/using-cors-to-access-asp-net-services-across-domains/" Topic="Asp.net Cors" iDate="2014-02-09T08:25:08.553" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:16.610" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:16.800" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:17.180" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:22.040" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:26.443" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:26.693" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:27.187" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:32.050" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:36.440" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:36.693" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:37.170" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:42.060" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:46.440" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:46.687" />
<info Name="http://getbootstrap.com/components/" iDate="2013-11-16T16:31:47.167" />
<info Name="http://www.asp.net/web-api/overview" Topic="Web API" iDate="2014-02-09T08:28:06.730" />
<info Name="http://www.future-processing.pl/blog/database-unit-testing/" Topic="SSDT" Tags="Unit Testing" iDate="2014-02-17T00:41:56.767" />
<info Name="http://www.runasradio.com" iDate="2013-10-10T05:20:52.130" />
<info Name="http://www.runasradio.com" iDate="2013-10-10T05:21:05.050" />
<info Name="http://www.w3schools.com/dtd/dtd_el_vs_attr.asp" Topic="Create attribute bXML Elements vs. Attribibutes" Tags="XML" iDate="2014-02-10T05:56:54.687" />
<info Name="https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/5/html/Deployment_Guide/sso-config-firefox.html" Topic="Firefox" Tags="Enable Kerberos Authentication" iDate="2014-03-25T06:11:31.370" />
<info Name="https://github.com/LearnBoost/expect.js/&#xA;" Topic="Testing" Tags="expect.js" iDate="2014-02-18T22:34:27.280" />
<info Name="Info" iDate="2013-10-10T05:00:26.663" />
<info Name="inserting in disconnected elements: http://stackoverflow.com/questions/3608877/jquery-inserting-into-newly-created-elements" Topic="jQuery" Tags="Inserting DOM Elements" iDate="2014-02-25T02:46:40.890" />
<info Name="Installation: &lt;a href=&quot;http://www.hanselman.com/blog/IntroducingNodejsToolsForVisualStudio.aspx&quot;&gt;hanselman&lt;/a&gt;" Topic="NodeJS" Tags="NTVS Node Tools for Visual Studio" iDate="2014-02-12T13:30:45.270" />
<info Name="jdjdjjejdj;" iDate="2013-10-13T00:21:06.153" />
<info Name="jdjsjhddjjjd" iDate="2013-10-10T05:02:44.723" />
<info Name="jquery does not support XDomainRequest which is used from IE9 to issue cors requests" Topic="Cors" Tags="IE9 Issue" iDate="2014-02-09T22:19:18.043" />
<info Name="kdjfkasdk" iDate="2013-10-10T05:01:04.757" />
<info Name="kjdfk" Topic="kjdk" Tags="kjd" iDate="2014-02-09T06:47:51.253" />
<info Name="kjjjghfhffif" iDate="2013-11-02T14:58:37.780" />
<info Name="kjjjjjjjj" iDate="2014-02-09T12:59:44.707" />
<info Name="kjjjjjjjj" iDate="2014-02-09T12:59:49.597" />
<info Name="las vegas" iDate="2013-11-02T14:59:08.297" />
<info Name="ldkjfkladsj" Topic="rgjkdf" Tags="kjdflkaj" iDate="2014-02-14T08:11:24.510" />
<info Name="lkflsdk" Topic="kdjfklad" Tags="kjdlfkjadsklf" iDate="2014-02-09T07:54:32.643" />
<info Name="MSDS Article: http://www.asp.net/visual-studio/overview/2013/using-browser-link&#xA;" Topic="Visual Studio 2013" Tags="Browser Link" iDate="2014-05-18T00:10:29.857" />
<info Name="Multiple Browser Refresh possible" Topic="Visual Studio 2013" Tags="Browser Link" iDate="2014-05-18T00:09:53.260" />
<info Name="Newing up things;&#xA;Test Driver; Class Under Test, Friendly; Plural Sight: The Phsyhoclogy of testing;" Topic="Testing" Tags="Testable Code" iDate="2014-02-12T10:27:13.243" />
<info Name="No Cors Request in IE9: http://amareswar.blogspot.ch/2012/06/cors-issues-with-ie9-and-workarounds.html" Topic="Cors" iDate="2014-02-09T22:15:28.297" />
<info Name="Not parsed by parser" Topic="CDATA" Tags="XML" iDate="2014-02-10T05:58:51.887" />
<info Name="Pluralsight: Webstorage, Indexed DB, File System" Topic="HTML5" Tags="Learning" iDate="2014-02-09T12:56:13.097" />
<info Name="Prevent Gobal State / aka Singletons" Topic="Testing" Tags="Testable Code" iDate="2014-02-12T10:28:39.403" />
<info Name="Prevent: http://msdn.microsoft.com/en-us/library/ms161953%28v=sql.105%29.aspx" Topic="Sql" Tags="Injection" iDate="2014-02-17T02:17:14.457" />
<info Name="Project with extensive tests: http://benjamine.github.io/phenotype/test/test.html" Topic="Testing" Tags="Mocha" iDate="2014-02-18T06:23:02.323" />
<info Name="Refresh Browser Content: Alt + Ctrl + Enter" Topic="Visual Studio 2013" Tags="Browser Link" iDate="2014-05-18T00:09:06.817" />
<info Name="Reporters manage the test result output" Topic="Mocha" Tags="Reporters" iDate="2014-02-14T06:08:54.727" />
<info Name="Request.GetQueryNameValuePairs()" Topic="Web API" Tags="Get Query String" iDate="2014-04-01T07:29:16.510" />
<info Name="Resources:&#xA;&lt;a href=&quot;http://blogs.msdn.com/b/ssdt/archive/2012/12/07/getting-started-with-sql-server-database-unit-testing-in-ssdt.aspx&quot;&gt;MSDS: Gettting started&lt;/a&gt;&#xA;&lt;a href=&quot;&lt;a href=&quot;http://blogs.msdn.com/b/ssdt/archive/2012/12/07/getting-started-with-sql-server-database-unit-testing-in-ssdt.aspx&quot;&gt;MSDS: Gettting started&lt;/a&gt;&quot;&gt;Introduce feature&lt;/a&gt;&#xA;&lt;a href=&quot;http://www.sqlservercurry.com/2013/11/sql-server-database-unit-testing-using_16.html&quot;&gt;Sql Curry: Example Unit Tests&lt;/a&gt;&quot;&gt;Introduce feature&lt;/a&gt;&#xA;&lt;a href=&quot;http://blog.kevinarnold.com/2013/07/start-unit-testing-db-stored-procedures.html&quot;&gt;Create Test Project Example&lt;/a&gt;&quot;&gt;Introduce feature&lt;/a&gt;&#xA;" Topic="SSDT" Tags="Unit Testing" iDate="2014-02-12T23:28:21.073" />
<info Name="select * from sys.tables for xml raw,  root(''tables'')&#xA;&lt;tables&gt;&#xA;&#x9;  &lt;row name=&quot;spt_fallback_db&quot; object_id=&quot;117575457&quot; schema_id=&quot;1&quot; ......" Topic="Sql XML" Tags="Create attributed bases xml from table" iDate="2014-02-11T05:31:39.880" />
<info Name="select cast(ReleaseRules as varchar(max))&#x9;Rules" Topic="Sql XML" Tags="Convert XML Column to varchar" iDate="2014-02-11T05:27:25.950" />
<info Name="select object_id, name &#x9;&#x9;from&#x9;sys.tables &#x9;&#x9;where&#x9;type = ''U'' &#x9;&#x9;for xml raw, root(''usertables'') &#x9;&#x9;/** &#x9;&#x9;&#x9;&lt;usertables&gt; &#x9;&#x9;&#x9;&#x9;  &lt;row object_id=&quot;245575913&quot; name=&quot;tblSDS_SoftwareRelease&quot; /&gt; &#x9;&#x9;&#x9;&#x9;  &lt;row object_id=&quot;517576882&quot; name=&quot;tblPlanning_SystemRelease&quot; /&gt; &#x9;&#x9;&#x9;&#x9;  &lt;row object_id=&quot;549576996&quot; name=&quot;tblIsac_Persom&quot; /&gt; &#x9;&#x9;&#x9;&#x9;  &lt;row object_id=&quot;565577053&quot; name=&quot;tblIsac_Person&quot; /&gt; &#x9;&#x9;&#x9;&#x9;  &lt;row object_id=&quot;581577110&quot; name=&quot;tblSDS_SystemRelease&quot; /&gt; &#x9;&#x9;&#x9;&#x9;  &lt;row object_id=&quot;677577452&quot; name=&quot;tblC_DataDef&quot; /&gt; &#x9;&#x9;&#x9;&#x9;  &lt;row object_id=&quot;709577566&quot; name=&quot;tblC_SQL&quot; /&gt; &#x9;&#x9;&#x9;&lt;/usertables&gt; &#x9;&#x9;**/" Topic="Create attribute based records from table" Tags="Sql Server, XML" iDate="2014-02-10T05:55:38.740" />
<info Name="Sent List to Zoran and notification to i-SAC Engineering" Topic="MySDS" Tags="Issue" iDate="2014-02-11T01:56:23.577" />
<info Name="should, assert, expect&#xA;" Topic="Testing" Tags="Assertion Style" iDate="2014-02-19T02:30:09.080" />
<info Name="Table Name&#x9;Column Names in XML &#xA;---------------&#x9;------------------------------------------------------------------------&#xA;tblC_SQL&#x9;&#x9;&lt;name&gt;ID&lt;/name&gt;&lt;name&gt;iDate&lt;/name&gt;&lt;name&gt;SqlStatement&lt;/name&gt;&lt;name&gt;Descript..&#xA;tblC_SQLExec&#x9;&lt;name&gt;ID&lt;/name&gt;&lt;name&gt;iDate&lt;/name&gt;&lt;name&gt;Name&lt;/name&gt;&lt;name&gt;Description&lt;/nam..&#xA;&#xA;&#x9;select&#x9;name, c.cols &#xA;&#x9;from&#x9;sys.tables&#x9;t&#xA;&#x9;cross apply&#xA;&#x9;&#x9;&#x9;(&#xA;&#x9;&#x9;&#x9;&#x9;select&#x9;&#xA;&#x9;&#x9;&#x9;&#x9;(&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;select&#x9;name &#xA;&#x9;&#x9;&#x9;&#x9;&#x9;from&#x9;sys.columns&#x9;c&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;where&#x9;c.object_id = t.object_id&#xA;&#x9;&#x9;&#x9;&#x9;&#x9;    for xml path ('''')&#xA;&#x9;&#x9;&#x9;&#x9;)&#x9;cols&#xA;&#x9;&#x9;&#x9;)&#x9;c" Topic="Sql XML" Tags="Create table with xml child records" iDate="2014-02-11T05:34:24.097" />
<info Name="Tags, Converters, Helpers, Conditional format&#xA;http://www.bluelemoncode.com/post/2013/01/06/Revisiting-JsRender-and-more-Part-II.aspx" Topic="JSRender" Tags="Resource" iDate="2014-02-15T16:21:48.060" />
<info Name="Test Conditions&#xA;&lt;a href=&quot;http://msdn.microsoft.com/en-us/library/jj851223(v=vs.103).aspx&quot;&gt;Test Conditions&lt;/a&gt;&#xA;" Topic="SSDT" Tags="Unit Testing" iDate="2014-02-13T00:02:47.310" />
<info Name="this.getAttribute(&quot;data-report&quot;);&#xA;this.setAttribute(&quot;data-report&quot;);&#xA; &lt;a href=&quot;http://html5doctor.com/html5-custom-data-attributes/&quot;&gt;More Information&lt;/a&gt;&#xA;" Topic="HTML5" Tags="Custom data attribute" iDate="2014-02-15T16:19:56.020" />
<info Name="type directive forces the server to send result in xml data type instead of string. &lt;a href=&quot;http://technet.microsoft.com/en-us/library/ms190025.aspx&quot;&gt;--&gt;&lt;/a&gt;" Topic="Sql XML" Tags="for xml" iDate="2014-02-11T05:29:15.773" />
<info Name="Unit test steps: TestInitialize, Test Script, Pre-Test. Post-Test (Optional script run before after test action), TestCleanUp" Topic="SSDT" Tags="Unit Testing" iDate="2014-02-13T01:36:36.700" />
<info Name="Utilizes SignalR" Topic="Visual Studio 2013" Tags="Browser Link" iDate="2014-05-18T00:09:35.003" />
<info Name="Whats new Web API 2.1: http://www.asp.net/web-api/overview/releases/whats-new-in-aspnet-web-api-21" Topic="Asp.net Cors" iDate="2014-02-09T08:26:53.117" />
<info Name="when adding iframe to body throws: global leak detected: 0" Topic="Mocha" Tags="Global Leak" iDate="2014-03-25T03:42:57.503" />
<info Name="window.location.search : ?par1=val1r2&amp;par2=val2" Topic="Javascript" Tags="Read Query String" iDate="2014-04-01T07:29:00.327" />
<info Name="Write a failing test, Make test pass, refactor" Topic="Testing" Tags="TDD Style" iDate="2014-02-14T06:12:57.533" />
<info Name="xsfsfaffds" iDate="2014-02-10T23:08:36.840" />
	</info>
    
</Root>';




WITH CTE_ITEMS ([HId], [Infos], [Name], [Path]) 
AS 
( 
    SELECT  
        hierarchyid::GetRoot() as [HId], 
        VIRT.node.query('./*') as [Infos], 
        VIRT.node.value('@Name', 'nvarchar(500)') as [Name], 
        CAST('/' as nvarchar(max)) as [Path] 
        FROM @xml.nodes('/Root/*') as VIRT(node) 
    UNION ALL 
    SELECT  
        hierarchyid::Parse([HId].ToString() + VIRT.node.value('1+count(for $a in . return $a/../*[. << $a])', 'varchar(10)') + '/'), 
        VIRT.node.query('./*'),  
        VIRT.node.value('@Name', 'nvarchar(500)'), 
        [Path] +  
            CASE [Path] WHEN '/' THEN '' ELSE + '/' END +  
            VIRT.node.value('@Name', 'nvarchar(max)') 
    FROM  
    CTE_ITEMS CROSS APPLY Infos.nodes('./*') as VIRT(node) 
) 

-- select * from tblInfoH
insert into tblInfoH(Text, hid)
select	--[HId].ToString(),
		[Name], HID			-- [Path],[HId].GetLevel() 
from	CTE_ITEMS 
order	by
		[HId] 
