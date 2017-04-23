/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Tile UI for the Root Page

        Input       JSON Data
        
        Output      Templated HTML Markup

        Url         /#/view/Home                -- does not work in the mobile browser
  
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'viewInfoEdit', 'jsrender', 'amplify', 'bootstrap'  ], function ($, editView) {
       
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
    	        ';

    	


		$element.append(markup)

		$('#displayChange').on('click', function () {
			$('#infoEdit').toggle();
		});

		// get the dom element for displaying
		var $infoEdit = $($element).find('#infoEdit');
		var $infoHistory = $($element).find('#infoHistory');
		var $infoProgress = $($element).find('#infoProgress');

		// edit form
		 editView.display($infoEdit);
		
		// edit form
		require(['viewInfoList'], function (infoHistory) {
			infoHistory.display($infoHistory); 
		});

		//// information progress
		require(['viewInfoProgress'], function (infoProgress) {
			infoProgress.display($infoProgress);
		});
	};
	return {
		display: display
	}
});


