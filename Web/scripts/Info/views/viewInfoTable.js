/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Visulize a plaing table with all informations

        Input       JSON Data
        
        Output      Templated HTML Markup

        API        
        Testing     
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'infoData', 'jsrender', 'amplify'], function ($, iData) {
       
    // display a list of information
    var displayList = function ($element, data) {

        // {"Id":87,"parentId":null,"Level":1,"Name":"Visual Studio Shortcut","Key":"Open Solution Explorer",
        // "Value":"Alt ü","Url":null,"iDate":"2015-05-04 00:51:50","cDate":"0001-01-01T00:00:00"}

        // compile needed templates
        $.templates({
            itemTemplateDL: '<tr id={{:Id}} class="info" id={{:parentId}}>\
                                <td>{{:parentId}}</td>\
                                <td>{{:Name}}</td>\
                                <td>{{:Key}}</td>\
                                <td>{{:Value}}</td>\
                                <td>{{:Url}}</td>\
                                <td>{{:Level}}</td>\
                                <td>{{:iDate}}</td>\
                            </tr>'
        });

        // render data to data items
        var infolistMarkup = '<table class="table table-hover"><thead><th>parentId</th><th>Name</th><th>Key</th><th>Value</th><th>Url</th><th>Level</-th></tr></thead>' + $.render.itemTemplateDL(data) + '</table>';

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


