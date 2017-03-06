/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Dispaly Landing page for manageing informations

        Input       JSON Data
        
        Output      Templated HTML Markup

  
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'viewInfoEdit', 'jsrender', 'amplify'  ], function ($, editView) {
       
    // display a list of information
	var display = function ($element) {

		console.log('### Display viewHowme');

		
    	var markup = '<div class="row">\
						<div class="col-md-10">\
							<div id="infoEdit"></div>\
						</div>\
					</div>\
					<div class="row">\
						<div class="col-md-4" >\
							<h2>Information Progress Local</h2>\
							<div id="infoProgress"></div>\
						</div>\
						<div class="col-md-6 col-md-offset-1" >\
							<h2>Information History</h2>\
							<div id="infoHistory"></div>\
						</div>\
					<div/>';

		$element.append(markup)

		// get the dom element for displaying
		var $infoEdit = $($element).find('#infoEdit');
		var $infoHistory = $($element).find('#infoHistory');
		var $infoProgress = $($element).find('#infoProgress');

		// edit form
		 editView.display($infoEdit);
		
		//// edit form
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


