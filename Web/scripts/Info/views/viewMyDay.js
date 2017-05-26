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


    	// markup structure
    	var markup =
    					'<div class="row">\
							<div class="col-md-8">\
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
												<button id="deleteInfo" class="btn btn-default">Delete</button>\
											</div>\
										</div>\
									</div>\
									<div class="row">\
										<div class="col-md-4">\
											<div id="processMessage"><div>\
										</div>\
										<div class="col-md-4">\
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
							</div>\
						</div>\
    					<div class="row">\
							<div class="col-md-12">\
								<div>\
									<table id="dayInfos" class="table table-hover"><thead><th>Name</th><th>Key</th><th>Value</th><th>Level</th></tr></thead>' +
										'<tbody></tbody>\
									</table>\
								</div>\
							</div>\
						</div>\
    	';
    	
    	$element.append(markup);



		
		// get the stored info back from the server for updating the list
    	amplify.subscribe('info.created', function (info) {
			// visualize the newly created item
    		renderList($element.find('#dayInfos tbody'), info);
    	});


    	$element.find('#dayInfos').on('click', 'tbody tr', function () {
    		$(this).toggleClass('bg-success infoselected');
    	});



    	//// Delete all selected items
    	$element.find('#deleteInfo').on('click', function (e) {
			// get all selected items: having class infoselected
    		$element.find('tr.infoselected').each(function () {
    			viewInfoSave.deleteInfo($(this).attr('id'));
    		});

    	});

    	//// save event triggers save action
    	$element.find('#saveInfo').on('click', function (e) {
    		e.preventDefault();

    		// create a new object0
    		info = {};
    		info.ParentId = $('#inpParentId').val()
    		info.Value = $('#inpValue').val();

    		// just make sure all other publishes are deleted
    		amplify.publish('info.save', info);

    		// alert(JSON.stringify(data));
    		$('#processMessage').text("save information wating for receipt (" + new Date() + ")")

    	});

		// wee need a parent id to enhance the current day
		$.when(iData.infoDay(InfoName))
			.then(function (data) {
				
				var $disp = $('<div></div>');

				$element.append($disp);
				
				// enable display and subsription for imformation processing
				viewInfoSave.display($('#progress'));

				// Important: first record contains the dail record which is the parent for all subsequent records
				$('#inpParentId').val(data[0].Id);

				// and the items of the data
				renderList($element.find('#dayInfos tbody'), data);
			})
			.fail(function () {
			   	alert('Getting Info failed!');
			});
    };

	// render list of items from a particular day
    var renderList = function ($element, data) {

    	//[{ "Id": 4505, "ParentId": null, "Level": 1, "Name": "2017-05-26", "Key": "[day]", "Value": null, "Url": null, "iDate": "2017-05-25 22:18:00", "cDate": null }
    	//  .... ]

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

		// assumes the element given is a table
    	$element.append($.render.itemTemplateDL(data));
    };

	// request data for a particular day
    var getData = function (InfoName) {
    	return idata.infoDay(InfoName);
    }
    return {
        display: display   
    }
});


