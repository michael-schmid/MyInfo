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

        // remove a deleted item
        amplify.subscribe('info.deleted', function () {
            $currentItem.css('color', 'silver');
        })

    	getData()
		 .done(function (data, status, xhr) {

		 	// compile needed templates
		 	$.templates({

		 		itemTemplateDL: '<dt class="infoItem"  style="padding-left:{{:Level}}em" id={{:Id}}><h4> {{:Name}}<h4></dt>\
                             <dd>\
                                <div style="padding-left:{{:Level}}em">\
                                    <div>{{:Id}} {{:Key}}</div>\
									<div>{{:cDate}}</div>\
                                    {{if (Url || "") !== ""}}<a target="_blank" href="{{:Url}}">{{:Value}}</a>{{else}}{{:Value}}{{/if}}\
                                </div>\
                            </dd>'
		 	});

		 	// render data to data items
		 	var infolistMarkup = '<div id="infoDisplay class="infoDl"><dl >' + $.render.itemTemplateDL(data) + ' </dl></div>';


		 	// change edit object
		 	$($element)
				.on('click', '.infoItem', function () {
				    amplify.publish("info.select", $(this).attr('Id'));

                    // set the current item
				    $currentItem = $(this);
				    $currentItem.css('color', 'red');
				    
				});
		 	$element.append(infolistMarkup);
		 })

    };

    var getData = function () {
    	return infoData.journal();
    }

    return {
        display: displayList   
    }
});


