/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Tile UI for the Root Page

        Input       JSON Data
        
        Output      Templated HTML Markup

        Url         /#/view/Home                -- does not work in the mobile browser
  
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'viewInfoEdit', 'jsrender', 'amplify'  ], function ($, editView) {
       
    // display a list of information
	var display = function ($element) {

		console.log('### Display viewHowmeGrid');
		
    	var markup = '<div class="row">\
                          <div class="col-md-5 col-md-offset-2">\
                            <h3>Add / Change</h3>\
							<div id="displayChange">Change</div>\
                            <div id="infoEdit" style="display:none"></div>\
                                <h3>Log</h3>\
                                <div id="infoHistory"></div>\
                            </div>\
                           <div class="col-md-3">\
                                <h3 class="card-title">Days</h3>\
                                <h3 class="card-title">Search</h3>\
                                <h3 class="card-title">Stat</h3>\
                                <h3 class="card-title">Stat</h3>\
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


