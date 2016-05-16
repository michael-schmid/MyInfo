/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     visualize the information in an grid

        Input       JSON Data
        
        Output      Templated HTML Markup

  
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'infoData', 'jsrender', 'amplify'], function ($, iData) {
       
    // display a list of information
    var displayList = function ($element) {

    	// compile needed templates
    	$.templates({
    		itemTemplateDL: '    <tr id={{:Id}} class="info" id={{:parentId}}>\
									<td>{{:iDate}}</td>\
									<td><div>{{:Name}}</div>\
										<div>{{:Key}} {{:Value}} {{:Url}} <d/iv></td>\
								</tr>'
    	});

    	$.when(iData.data(88))
			.then(function (data) {

				// render data to data items
				var infolistMarkup = '<table class="table table-hover"><thead><th>parent Id</th><th>Name</th><th><th></th></tr></thead>' + $.render.itemTemplateDL(data) + '</table>';

				$element.append(infolistMarkup);
			});

        // Event: Items Selected
        $($element)
            .on('click', '.info', function () {
                amplify.publish("info.select", $(this).attr('Id'));
            });
    };
    return {
        display: displayList   
    }
});


