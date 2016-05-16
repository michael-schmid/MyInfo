/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose		Information History

        Input       JSON Data
        
        Output      Templated HTML Markup

        API         require(['viewHistory'], function(view) {
                        view.display($elelement, { Id: "testId", Name: "testName", Key: "testKey", Value: "testValue" }
                    });
        Testing     
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'infoData', 'jsrender', 'amplify'], function ($, iData) {
       

	var loadData = function () {
		var infoJournal = function () {
			var action = iConfig.serviceURL + "/info/0/journal";
			return $.ajax({ url: action, type: "GET", contentType: "application/json;charset=utf-8" });
		};
	};

    // display a list of information
    var displayList = function ($element, data) {

        // compile needed templates
        $.templates({
          
            itemTemplateDL: '<dt class="info" id={{:Id}}><span style="padding-left:{{:Level}}em">{{:Name}}</span></dt>\
                             <dd>\
                                <div style="padding-left:{{:Level}}em">\
                                    <div>{{:Key}}</div>\
                                    {{if (Url || "") !== ""}}<a target="_blank" href="{{:Url}}">{{:Value}}</a>{{else}}{{:Value}}{{/if}}\
                                </div>\
                            </dd>'
        });

        // render data to data items
        var infolistMarkup = '<div id="infoDisplay"><dl>' + $.render.itemTemplateDL(data) + ' </dl></div>';

        // change edit object
        $($element)
            .on('click', '.info', function () {
                amplify.publish("info.select", $(this).attr('Id'));
            });
        $element.append(infolistMarkup);
    };
    return {
        display: displayList   
    }
});


