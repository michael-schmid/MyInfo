/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Visulize a plaing table with all informations

        Input       JSON Data
        
        Output      Templated HTML Markup

        API         require(['viewInfoTable'], function(view) {
                        view.display($elelement, { Id: "testId", Name: "testName", Key: "testKey", Value: "testValue" }
                    });

        URL         /#/view/InfoEdit

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

    var display = function ($element, infoDetail, parentId) {

        // create a wrapper object to access the infoDetail with .infoDetail notation
        var infoRoot = [{ info: infoDetail }];

        
        // default: new root object
        if (!infoDetail)
            var infoDetail = { ParentId: parentId, Key: "", Value: "", Url: "", Name: "Name" };


        // compile needed templates
        $.templates({
        	editTemplate: '<div class="editForm">\
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
										<div class="col-md-4">\
											<button id="saveInfo" class="btn btn-default">Save</button>\
											<button id="deleteInfo" class="btn btn-default">Delete</button>\
											<button id="newInfo" class="btn btn-default">New</button>\
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
										<div class="col-md-8">\
											<label for="inpKey" >Key</label><br />\
											<input type="text" value="{{:Key}}" class="form-control no-border" id="inpKey" placeholder="Key">\
										</div>\
									</div>\
								</form>\
							</div>'
        });

        // add the form to the element
        var $editForm = $($.render.editTemplate(infoDetail));
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
        amplify.subscribe("info.select", function (infoId) {
            $.when(iData.data(infoId))
            .then(function (data) {

                console.log('infoEdit: receive info.select event: ' + infoId);
                // alert(JSON.stringify(data));
                refreshData(data[0]);
                
                // make the edit form visible
                $element.show();
            });
        });



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


