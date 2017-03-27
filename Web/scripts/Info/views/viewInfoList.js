/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose		Information Definition List Display

        Input       JSON Data
        
        Output      Templated HTML Markup

        API         require(['viewHistory'], function(view) {
                        view.display($elelement, { Id: "testId", Name: "testName", Key: "testKey", Value: "testValue" }
                    });

		URL			/#/view/InfoList



        Testing     
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'infoData', 'jsrender', 'amplify'], function ($, infoData) {
       
	
    // display a list of information
    var displayList = function ($element) {

        var $currentItem;
        var infoTemplate = '<li class="infoItem"  id={{:Id}}> {{:Name}}\
                                {{:Value}}\
                                <div class="detail">\
                                      {{if (Url || "") !== ""}}<a target="_blank" href="{{:Url}}">Link</a>{{else}}{{/if}}\
                                        id: {{:Id}} {{:Key}}  iDate: {{:iDate}} parentId: {{:ParentId}}\
                                </div>\
                            </li>'
        // remove a deleted item
        amplify.subscribe('info.deleted', function () {
            $currentItem.remove();
        })

		// when an info item is created add a new info to the list
        amplify.subscribe('info.created', function (info) {
        	$element.find('#infolist').prepend($.render.itemTemplateDL([info]));
        })


    	getData()
		 .done(function (data, status, xhr) {

		 	// compile needed templates
		 	$.templates({ itemTemplateDL: infoTemplate });

		 	// render data to data items
		 	var infolistMarkup = '<div id="infoDisplay"><ul id="infolist">' + $.render.itemTemplateDL(data) + ' </ul></div>';
		 	$element.append(infolistMarkup);
			
		 	// change edit object
		     $($element)
				.on('click', '.infoItem', function () {
				    amplify.publish("info.select", $(this).attr('Id'));

                    // set the current item
				    $currentItem = $(this);
				    $currentItem.css('color', 'red');
				});
		 })
    };

    var getData = function () {
    	return infoData.journal();
    }

    return {
        display: displayList   
    }
});


