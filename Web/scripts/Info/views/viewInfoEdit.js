/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Visulize a plaing table with all informations

        Input       JSON Data
        
        Output      Templated HTML Markup

        API         require(['viewInfoTable'], function(view) {
                        view.display($elelement, { Id: "testId", Name: "testName", Key: "testKey", Value: "testValue" }
                    });
        Testing     
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'infoData', 'infoStore', 'jsrender', 'amplify'], function ($, iData, iStore) {
       
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


        // compile needed templates
        $.templates({
            editTemplate: '<div>\
                            <form role="form" class="form-horizontal">\
                                <div class="row">\
                                    <div class="col-md-6">\
                                        <label for="inpKey">Key</label><br />\
										<input type="text" value="{{:Id}}" class="form-control" id="infoId" placeholder="Key">\
										<div class="row">\
											<div class="col-md-10">\
												<div class="form-group">\
													<label for="inpName">Name</label><br />\
													<textarea type="text" value="{{:Name}}" class="form-control" id="inpName" placeholder="Name"></textarea>\
												</div>\
											</div>\
										</div>\
										<div class="row">\
										<div class="col-md-6">\
												<div class="form-group">\
													<label for="inpKey">Key</label><br />\
													<input type="text" value="{{:Key}}" class="form-control" id="inpKey" placeholder="Key">\
												</div>\
											</div>\
											<div class="col-md-4">\
												<div class="form-group">\
													<label>Action</label><br />\
													<button id="saveInfo" class="btn btn-default">Save</button>\
													<button id="deleteInfo" class="btn btn-default">Delete</button>\
													<button id="newInfo" class="btn btn-default">New</button>\
												</div>\
											</div>\
										</div>\
									</div>\
									<div class="col-md-4">\
										<div class="row">\
											<div class="col-md-7 col-md-offset-1">\
												<div class="form-group">\
													<label for="inpValue">Value</label>\
													<input type="text" value="{{:Value}}" class="form-control" id="inpValue" placeholder="Value">\
												</div>\
											</div>\
										</div>\
										<div class="row">\
											<div class="col-md-7 col-md-offset-1">\
												<div class="form-group">\
														<div id="InfoId">{{:Id}}</div>\
													<label for="inpParentID">ParentID</label><br />\
													<input type="text" value="{{:ParentId}}" class="form-control" id="inpParentID" placeholder="ParentID">\
												</div>\
											</div>\
										</div>\
										<div class="row">\
											<div class="col-md-7 col-md-offset-1">\
												<div class="form-group">\
														<label for="inpUrl">Url</label><br />\
													<input type="text" value="{{:Url}}" class="form-control" id="inpUrl" placeholder="Url">\
												</div>\
										</div>\
									</div>\
                                    </div>\
                              </div>\
							</form>\
						</div>'
        });

        // add the form to the element
        var $editForm = $($.render.editTemplate(infoDetail));
        $element.empty().append($editForm);


        

        // save event triggers save action
        $editForm.find('#saveInfo').on('click', function (e) {
            e.preventDefault();

            // create a new object0
            info = {};

            info.Id = $('#infoId').val();
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


