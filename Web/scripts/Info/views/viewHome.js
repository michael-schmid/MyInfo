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
                            <div class="card">\
                              <div class="card-block">\
                                <h3 class="card-title">Log</h3>\
                                <div id="infoHistory"></div>\
                              </div>\
                            </div>\
                            </div>\
                           <div class="col-md-3">\
                            <div class="card">\
                              <div class="card-block">\
                                <h3 class="card-title">New</h3>\
                                <div id="infoEdit"></div>\
                              </div>\
                            </div>\
                                <div class="card">\
                              <div class="card-block">\
                                <h3 class="card-title">Days</h3>\
                              </div>\
                            </div>\
                            <div class="card">\
                              <div class="card-block">\
                                <h3 class="card-title">Search</h3>\
                              </div>\
                            </div>\
                                <div class="card">\
                                    <div class="card-block">\
                                        <h3 class="card-title">Stat</h3>\
                                    </div>\
                                </div>\
                                <div class="card">\
                                    <div class="card-block">\
                                        <h3 class="card-title">Stat</h3>\
                                    </div>\
                                </div>\
                          </div>\
                        </div>\
					<div/>\
                    <div class="row">\
                          <div class="col-md-6">\
                          </div>\
                        </div>\
					<div/>\
    	        ';

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


