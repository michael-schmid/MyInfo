/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Edit an information record

        Input       JSON Data
        
        Output      Templated HTML Markup

        API          require(['viewInfoEdit'], function(view) {
                        view.display($elelement, { Id: "testId", Name: "testName", Key: "testKey", Value: "testValue" }
                    });

        URL         /#/view/InfoEdit
					/#/edit/4505

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
        $('#infoId').text(info.Id);
        $('#inpName').val(info.Name);
    };

    var display = function ($element, infoId) {
				
        // compile needed templates
    	var markup = '<div class="editForm">\
								<form role="form">\
									<div class="form-group row">\
										<div class="col-md-2">\
											<div style="color:white; font-size:2em" id="infoId">{{:Id}}</div>\
										</div>\
										<div class="col-md-3">\
											<div style="color:white; font-size:2em">Change</div>\
										</div>\
										<div class="col-md-2">\
											<!-- Display info processing -->\
											<div id="progress"></div>\
										</div>\
									</div>\
									<div class="form-group row">\
										<div class="col-md-2">\
											<label for="inpName">Name</label><br />\
									</div>\
										<div class="col-md-10">\
											<textarea type="text" value="{{:Name}}" class="form-control no-border" id="inpName" placeholder="Name"></textarea>\
										</div>\
									</div>\
									<div class="form-group row">\
										<div class="col-md-2">\
											<label for="inpValue" >Value</label>\
										</div>\
										<div class="col-md-10">\
											<input type="text" value="{{:Value}}" class="form-control no-border" id="inpValue" placeholder="Value">\
										</div>\
									</div>\
									<div class="form-group row">\
										<div class="col-md-2">\
											<label for="inpUrl">Url</label><br />\
										</div>\
										<div class="col-md-10">\
											<input type="text" value="{{:Url}}" class="form-control no-border" id="inpUrl" placeholder="Url">\
										</div>\
									</div>\
									<div class="form-group row">\
										<div class="col-md-2 offset-md-2">\
											<label for="inpParentID">ParentID</label><br />\
											<input type="text" value="{{:ParentId}}" class="form-control no-border" id="inpParentID" placeholder="ParentID">\
										</div>\
										<div class="col-md-4">\
											<label for="inpKey" >Key</label><br />\
											<input type="text" value="{{:Key}}" class="form-control no-border" id="inpKey" placeholder="Key">\
										</div>\
									</div>\
									<div class="form-group row">\
										<div class="col-md-4">\
											<button id="saveInfo" class="btn btn-default">Save</button>\
											<button id="deleteInfo" class="btn btn-default">Delete</button>\
											<button id="newInfo" class="btn btn-default">New</button>\
										</div>\
										<div class="col-md-6">\
											<div id="processMessage"><div>\
										</div>\
									</div>\
								</form>\
							</div>';
     

        // add the form to the element
         var $editForm = $(markup);
    	//$.render.editTemplate(infoDetail)

        $element.empty().append($editForm);

    	// enable display and subsription for imformation processing
        viewInfoSave.display($('#progress'));
		
        // save event triggers save action
        $editForm.find('#saveInfo').on('click', function (e) {
            e.preventDefault();

            // create a new object0
            info = {};

            info.Id = $('#infoId').text();
            info.ParentID = $('#inpParentID').val()
            info.Name = $('#inpName').val();
            info.Key = $('#inpKey').val();
            info.Value = $('#inpValue').val();
            info.Url = $('#inpUrl').val();
            info.Saved = undefined;

            amplify.publish('info.save', info);
        });

        // delete an information
        $editForm.find('#deleteInfo').on('click', function (e) {
            e.preventDefault();

            var infoId = $('#infoId').text();

            $.when(iData.delete(infoId))
                .then(function (data) {
                    console.log('infoEdit: receive info.delete event: ' + infoId);
                    amplify.publish("info.deleted", infoId);
                })
                .fail(function () {
                    alert('Delete Info failed: ' + infoId);
                });
        });
        
		// Display information on select event (from the information list)
        amplify.subscribe("info.select", function (infoId, $editDisplay) {
            $.when(iData.data(infoId))
            .then(function (data) {

                console.log('infoEdit: receive info.select event: ' + infoId);
            	// alert(JSON.stringify(data));
                $('#processMessage').text("Successfully retrieved information from the data service to display (" + new Date() + ")")

                refreshData(data[0]);
                
                if (!!$editDisplay && $editDisplay.length > 0) {
					// Enable Inline Edit from the Infolist
                	// we found an edit object to display
                	$element.show().appendTo($editDisplay);
                } else {
                	// display the edit on the defined place
                	// make the edit form visible
                	$element.show();
                }
				////// Full Screen Modus ?????
            });
        });

		// when information id is given load die info and display for editing
        if (!!infoId === true) {
        	setTimeout(function () {
        		amplify.publish("info.select", infoId);
        	}, 1000)
        }

        //// create a new item
        //$editForm.find('#newInfo').on('click', function (e) {
        //    e.preventDefault();
        //    // create a new object0
        //    info = {};
        //    info.ParentID = $('#inpParentID').val()
        //    info.Name = $('#inpName').val();
        //    info.Key = $('#inpKey').val();
        //    info.Value = $('#inpValue').val();
        //    info.Url = $('#inpUrl').val();
        //    // save new information
        //    saveInfo($('#newInfo').text(), info);
        //});
    };
    return {
        display: display   
    }
});


