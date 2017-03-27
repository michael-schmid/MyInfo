/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Sent a new information to the server

        Input       JSON Data
        
        Output      Templated HTML Markup
		  
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'amplify', 'infoData'], function ($, amplify, iData) {
    
	var $iList;
	var infos;

	// display a list of information
	var display = function ($element) {

	    $iList = $('<ul></ul>').appendTo($element);
        
		// save objects
		amplify.subscribe('info.save', function (info) {
		    // save and send to the server
			save(info);

            // append it to the progress list
			$iList.append('<li>' + info.Name + '</li>');
		});
		
	};
        
	// send the info object for update
	var save = function (info) {
    
        console.log('## Save item ' + info.index + ' Saved: ' + (info.Saved || 'n/a'));

		// return a promise
	    if (!!info.Id) {
            // id exist: save the already existing item
            var promise = iData.update(info.Id, info);
        }
        else {
            // no id create a new item.
	    	var promise = iData.create(info.Name, info);

	    	amplify.publish('info.created', info);

        }
		promise.done(function () {
		    // set the savd date
		    info["Saved"] = (new Date().toJSON());
		});



		return promise;
	};
	return {
		display: display
	}
})