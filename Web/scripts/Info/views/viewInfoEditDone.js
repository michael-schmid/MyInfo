/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Edit form for giving a certain done information

        Input       JSON Data
        
        Output      Templated HTML Markup

        API         

        UrL         /#/done

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

    var display = function ($element, infoDetail, parentId) {

        // create a wrapper object to access the infoDetail with .infoDetail notation
        var infoRoot = [{ info: infoDetail }];
        
        // default: new root object
        if (!infoDetail)
            var infoDetail = { ParentId: parentId, Key: "", Value: "", Url: "", Name: "Name" };
        
        // with a done information is the name the current date
        var today = new Date().toJSON().slice(0, 10).replace(/-/g, '-');        // -- 

        infoDetail.ParentId = today;

        // compile needed templates
        $.templates({
            editTemplate: '<div>\
                            <h2>Done</h2>\
                            <form role="form" class="form-horizontal">\
                                <div class="row">\
								    <div class="col-md-5">\
                                        <!-- Name Value = Done TextCurrent Date -->\
										<div class="form-group">\
										    <label for="inpValue">What\'s finished:</label>\
										    <textarea type="text" value="{{:Value}}" class="form-control" id="inpValue" placeholder="Value"></textarea>\
										</div>\
                                    </div>\
                                    <div class="col-md-2">\
                                        <!-- Name Field = Current Date -->\
										<div class="form-group">\
											<label for="ParentId">Parent Id</label><br />\
											<input type="text" value="{{:ParentId}}" class="form-control" id="inpParentId" placeholder="Current Date"></input>\
										</div>\
									</div>\
								</div>\
								<div class="row">\
									<div class="col-md-10">\
										<div class="form-group">\
											<button id="saveInfo" class="btn btn-default">Save</button>\
										</div>\
									</div>\
								</div>\
							</form>\
                            <!-- Display info processing -->\
                            <div id="progress"></div>\
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

            info.Id = $('#infoId').val();
            info.ParentId = $('#inpParentId').val()
            info.Name = $('#inpName').val();
            info.Key = $('#inpKey').val();
            info.Value = $('#inpValue').val();
            info.Url = $('#inpUrl').val();
            info.Saved = undefined;


			// just make sure all other publishes are deleted
        	
            amplify.publish('info.save', info);



        });

        // delete an information
        $editForm.find('#deleteInfo').on('click', function (e) {
            e.preventDefault();

            var infoId = $('#infoId').val();

            $.when(iData.delete(infoId))
                .then(function (data) {
                    console.log('infoEdit: receive info.delete event: ' + infoId);
                    amplify.publish("info.deleted", infoId);
                })
                .fail(function () {
                    alert('Delete Info failed: ' + infoId);
                });
        });
        
        amplify.subscribe("info.select", function (infoId) {
            $.when(iData.data(infoId))
            .then(function (data) {
                console.log('infoEdit: receive info.select event: ' + infoId);
                // alert(JSON.stringify(data));
                refreshData(data[0]);
            });
        });
    };
    return {
        display: display   
    }
});


