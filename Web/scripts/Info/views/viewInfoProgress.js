/// <reference path="viewHome.js" />
/*  ------------------------------------------------------------------------------------------------------------------------
        Visualize Inforamtion Data

        Purpose     Visualize the processing of Information to the database

        Input       JSON Data
        
        Output      Templated HTML Markup
		  
    --------------------------------------------------------------------------------------------------------------------- **/

define(['jquery', 'amplify', 'infoData'], function ($, amplify, iData) {


	var $iList;
	var infos;

	// display a list of information
	var display = function ($element) {

	    $iList = $('<ul></ul>').appendTo($element);
		
		// get the locally stored infos
		infos = amplify.store('infoList');

		if (!infos) {
			infos = amplify.store('infoList', []);
		}
        
	    $('<button type="button" class="btn btn-primary">Get JSON</button>')
            .on('click', function () {
                displayJSON();
            })
	        .appendTo($element);

		$('<button type="button" class="btn btn-primary">Set JSON</button>')
            .on('click', function () {
                setJSON();
            })
            .appendTo($element);

		$text = $('<div><textarea class="form-control" rows="10" id="infoJSON"></textarea></div>');
		$element.append($text);

        // visualize the infos
		displayLocalProgressList();

		// save objects
		amplify.subscribe('info.saveprogress', function (info) {
			
            // create a new entry in the progess list
			infos.push(info);
			
		    // save and send to the server
			save(info);

            // append it to the progress list
			$iList.append('<li>' + info.Name);

			//// store the info locally:
			amplify.store('infoList', infos);
		});
		// check if all locally information were sent to the server
		checkSave();
	};

    // manage display of import / export function
    // to 
	var displayJSON = function () {
	    $('#infoJSON')
            .text(JSON.stringify(infos));
	};
	var setJSON = function () {

	    // parse the text
	    newInfos = JSON.parse($('#infoJSON').text());

	    // push it to the 
	    for (var i = 0; i < newInfos.length; i++) {
	        infos.push(newInfos[i]);
	    }
	    //// store the info locally:
	    amplify.store('infoList', infos);
	};

    // visualize the current stored infos in the list of the progress view
	var displayLocalProgressList = function () {

	    $iList.empty();
        
	    // display existing elements (unsaved element?)
	    infos.forEach(function (info) {
	        var $item = $('<li>' + info.Name + '(saved:' + info.Saved + '</li>');

	        // create mew listitem
	        $iList.append($item);

	        // store the index of the list item for refernecing it later
	        info.index = $item.index();
	    });

	}

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
        }

        promise.done(function () {
		    // set the savd date
		    info["Saved"] = (new Date().toJSON());
		});

		return promise;
        // needed when faking
		//var $def = $.Deferred();
		//$def.resolve();
		//return $def;
	};

	// check all info to be saved
	var checkSave = function () {

		// run through all locally stored items
		for (var i = 0; i < infos.length; i++) {

			var info = infos[i];

			//// check if the saved flag not exist, then send to the server
			//if (!!info["Saved"] === false) {
			//	save(info)
			//	  .done(function () {
			//	  	// {"ParentID":"","Name":"dfksjadkfjas","Key":"","Value":"","Url":"","index":0}
			//	  	console.log('## Check item ' + i + ' Saved: ' + (info.Saved || 'n/a'));

			//	  	// update the visualization
			//	  	$iList.get(info.index);

			//	  	//// store the info locally:
			//	  	amplify.store('infoList', infos);
			//	  });
			//}
		}
	}
	return {
		display: display
	}
})