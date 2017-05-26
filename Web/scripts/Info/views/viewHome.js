/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Tile UI for the Root Page

        Input       JSON Data
        
        Output      Templated HTML Markup

        Url         /#/view/Home                -- does not work in the mobile browser
  
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'jsrender', 'amplify', 'bootstrap'  ], function ($) {
       
    // display a list of information
	var display = function ($element) {

		console.log('### Display viewHowmeGrid');
		
		var markup = '	<div class="row">\
							<div class="col-md-3">\
								<h1>Information</h1>\
							</div>\
							<div class="col-md-3">\
									<div class="btn-group" data-toggle="buttons">\
										<i style="font-size:35px" class="fa fa-plus-square pull-left"></i>\
									</div>\
							</div>\
							<div class="col-md-2">\
								<div class="btn-group" data-toggle="buttons">\
								  <label class="btn btn-primary active">Search\
									<input type="radio" name="options" id="option1" autocomplete="off" checked>\
								  </label>\
								  <label class="btn btn-primary">Log\
									<input type="radio" name="options" id="option2" autocomplete="off">\
								  </label>\
								  <label class="btn btn-primary">Days\
									<input type="radio" name="options" id="option3" autocomplete="off">\
								  </label>\
									<label class="btn btn-primary">Stat\
									<input type="radio" name="options" id="option3" autocomplete="off">\
								  </label>\
								</div>\
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
						<div class="views card-columns">\
							<div id="root" class="card card-inverse card-primary  p-5 text-center">\
								<blockquote class="card-blockquote">\
									<h2>Root</h2>\
								</blockquote>\
							</div>\
							<div id="MyDay" class="card card-inverse card-primary  p-5 text-center">\
								<blockquote class="card-blockquote">\
									<h2>My Day</h2>\
								</blockquote>\
							</div>\
							<div id="Performance" class="card card-inverse card-primary p-5 text-center">\
								<blockquote class="card-blockquote">\
									<h2>Performance</h2>\
								</blockquote>\
							</div>\
							<div id="infoList" class="card card-inverse card-primary p-5 text-center">\
								<blockquote class="card-blockquote">\
									<h2>Hierarchy</h2>\
								</blockquote>\
							</div>\
							<div id="infoDays" class="card card-inverse card-primary p-5 text-center">\
								<blockquote class="card-blockquote">\
									<h2>Days</h2>\
								</blockquote>\
							</div>\
							<div class="card card-inverse card-primary p-5 text-center">\
								<blockquote class="card-blockquote">\
									<h2>Log</h2>\
								</blockquote>\
							</div>\
							<div class="card card-inverse card-primary p-5 text-center">\
								<blockquote class="card-blockquote">\
									<h2>New</h2>\
								</blockquote>\
							</div>\
						</div>\
					</div>\
				</div>\
            </div>\
        </div>\
    	        ';
		$element.append(markup)
		// get the apprpropate view
		$('.views').on('click', function (e) {
			console.log(e.target.id)
			document.location.href = "/#/view/" + e.target.id;
		});
	};
	return {
		display: display
	}
});


