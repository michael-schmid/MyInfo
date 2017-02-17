/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Dispaly Landing page for manageing informations

        Input       JSON Data
        
        Output      Templated HTML Markup

  
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'viewInfoEdit', 'jsrender', 'amplify'  ], function ($, editView) {
       
    // display a list of information
	var display = function ($element) {

    	var markup = '<div class="row">\
						<div class="col-md-3">\
							<div id="infoEdit"></div>\
						</div>\
						<div class="col-md-6" >\
							<div id="infoHistory"></div>\
						</div>\
					<div/>';

		$element.append(markup);

		// get the dom element for displaying
		var $infoEdit = $($element).find('#infoEdit');
		var $infoHistory = $($element).find('#infoHistory');

		// edit form
		 editView.display($infoEdit);
		
		//// edit form
		require(['viewHistory'], function (infoHistory) {
			infoHistory.display($infoHistory); 
		});
	};
	return {
		display: display
	}
});


