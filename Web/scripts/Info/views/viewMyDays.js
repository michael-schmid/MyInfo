/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Display Day Tiles

        Input       JSON Data
        
        Output      Templated HTML Markup

        Url         /#/view/mydays                -- does not work in the mobile browser
  
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'viewInfoEdit', 'jsrender', 'amplify', 'bootstrap'  ], function ($, editView) {
       
    // display a list of information
	var display = function ($element) {

		console.log('### Display viewHowmeGrid');
		
		var markup = '	<div class="row">\
							<div class="col-md-3">\
								<h1>My Day Information</h1>\
							</div>\
						</div>\
						<div class="row">\
                          <div class="col-md-8">\
                            <h3>Add / Change</h3>\
							<div id="displayChange">Change</div>\
                            <div id="infoEdit" style="display:none"></div>\
                                <h3>Log</h3>\
                                <div id="infoHistory"></div>\
                            </div>\
                        </div>\
					<div/>\
				<div class="row">\
					<div class="col-md-8">\
						<div id="dayCollectionDisplay" class="views card-columns">\
						</div>\
					</div>\
				</div>\
            </div>\
        </div>\
    	        ';

		// add html structure
		$element.append(markup)

		// render the day elements
		renderDays($element.find('#dayCollectionDisplay'));


		// get the apprpropate view
		$('#dayCollectionDisplay').on('click', '.card',  function (e) {
			console.log(e.target)
			document.location.href = "/#/myday/" + e.target.id;
		});
	};

	var renderDays = function ($element) {

		// template markup for each day to display
		var data = [
			{ Name : '2017-05-1', InfoCount: 4}	,
			{ Name : '2017-05-2', InfoCount: 5}	,
			{ Name : '2017-05-3', InfoCount: 7}	,
			{ Name : '2017-05-4', InfoCount: 2}	,
			{ Name : '2017-05-5', InfoCount: 8}	,
			{ Name : '2017-05-6', InfoCount: 6}	,
			{ Name : '2017-05-7', InfoCount: 4}

		]

		// compile needed templates
		$.templates({
			dayT: '<div id="{{:Name}}" class="card card-inverse card-primary  p-5 text-center">\
						<blockquote class="card-blockquote">\
							<h2>{{:Name}}</h2>\
							<h1>{{:InfoCount}}</h1>\
						</blockquote>\
					</div>'
		});
		// render data to data items
		$element.append($.render.dayT(data));
	};
	return {
		display: display
	}
});


