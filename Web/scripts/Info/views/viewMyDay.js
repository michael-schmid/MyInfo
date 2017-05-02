/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Template for reporting on my day

        Input       JSON Data
        
        Output      Templated HTML Markup

        API         

        UrL         /#/myday

        Testing     
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'infoData', 'infoStore', 'viewInfoSave', 'jsrender', 'amplify'], function ($, iData, iStore, viewInfoSave) {
       
    // refresh the displayed data for editing
    var refreshData = function (info) {
        // create a new object0
        $('#inpParentID').val(info.ParentID);
        $('#inpKey').val(info.Key);
        $('#inpValue').val(info.Value); 
        $('#inpUrl').val(info.Url);
        $('#infoId').val(info.Id);
        $('#inpName').val(info.Name);
    };

    var display = function ($element, InfoName) {

		// request the hierarchy data for a day
    	//getData.done(function (data) {
    	//	alert(JSON.stringify(data));
    	//});

    	$.when(iData.infoDay(InfoName))
			.then(function (data) {
				
				var $disp = $('<div></div>');

				$element.append($disp);

				// output current data
				// $disp.text(JSON.stringify(data));

				// enable display and subsription for imformation processing
				viewInfoSave.display($('#progress'));

				// edit template
				renderEdit($element, data[0]);
				
				//
				renderList($element, data);
			})
			.fail(function () {
			   	alert('Delete Info failed: ' + infoId);
			});
    };


    var renderEdit = function ($element, data) {
    	// compile needed templates
    	$.templates({
    		editTemplate: '<div>\
                            <form role="form" class="form-horizontal">\
								<div class="row">\
									<div class="col-md-3">\
										<h2>My Day</h2>\
									</div>\
									<div class="col-md-2">\
                                        <!-- Name Field = Current Date -->\
										<div class="form-group">\
											<label for="ParentId">Parent Id</label><br />\
											<input type="text" value="{{:Id}}" class="form-control" id="inpParentId" placeholder="Current Date"></input>\
										</div>\
									</div>\
								</div>\
                                <div class="row">\
								    <div class="col-md-5">\
                                        <!-- Name Value = Done TextCurrent Date -->\
										<div class="form-group">\
										    <label for="inpValue">What\'s finished:</label>\
										    <textarea type="text" value="{{:Value}}" class="form-control" id="inpValue" placeholder="Value"></textarea>\
										</div>\
										<div class="form-group">\
											<button id="saveInfo" class="btn btn-default">Save</button>\
										</div>\
                                    </div>\
								</div>\
								<div class="row">\
									<div class="col-md-8">\
										<h2>Work -\
										Sport -\
										Haushalt/Familie -\
										Lernen -\
										Schlafen</h2>\
									</div>\
								</div>\
							</form>\
                            <!-- Display info processing -->\
                            <div id="progress"></div>\
						</div>'
    	});

    	// add the form to the element
    	var $editForm = $($.render.editTemplate(data));
    	$element.empty().append($editForm);


    	//// save event triggers save action
    	$editForm.find('#saveInfo').on('click', function (e) {
    		e.preventDefault();

    		// create a new object0
    		info = {};
    		info.ParentId = $('#inpParentId').val()
    		info.Value = $('#inpValue').val();

    		// just make sure all other publishes are deleted
    		amplify.publish('info.save', info);
    	});

    };

	// render list of items from a particular day
    var renderList = function ($element, data) {
    	// compile needed templates
    	$.templates({
    		itemTemplateDL: '<tr id={{:Id}} class="info" id={{:parentId}}>\
    	                <td>{{:Name}}</td>\
    	                <td>{{:Key}}</td>\
    	                <td>{{:Value}}</td>\
    	                <td>{{:Level}}</td>\
    	                <td>{{:iDate}}</td>\
    	            </tr>'
    	});

    	// render data to data items
    	var infolistMarkup = '	<div class="row">\
									<div class="col-md-8">\
										<table class="table table-hover"><thead><th>Name</th><th>Key</th><th>Value</th><th>Level</-th></tr></thead>' + $.render.itemTemplateDL(data) + '</table>\
									</div>\
								</div>\
								';
    	 $element.append(infolistMarkup);
    };

	// request data for a particular day
    var getData = function (InfoName) {
    	return idata.infoDay(InfoName);
    }
    return {
        display: display   
    }
});


