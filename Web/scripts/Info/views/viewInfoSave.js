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
		// 
	    function saveF(info) {

	    	// new item to send to the server
	    	var saveItem = '<li id="save">' + JSON.stringify(info) + '</li>';

	    	// append it to the progress list
	    	$iList.append(saveItem);

	    	// save and send to the server
	    	save(info)
	    		.done(function () {
	    			$iList.text('saved');
	    		})
	    		.fail(function () {
	    			$iList.text('error');
	    		});
	    	return false;
	    }

		//// fist unsubscrbe all to prevent double saves
	    //amplify.unsubscribe('info.save', saveF);
		// save objects
		amplify.subscribe('info.save', saveF);
		
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