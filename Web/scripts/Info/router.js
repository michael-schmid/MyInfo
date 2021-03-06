﻿/// <reference path="infoData.js" />

/*
        Routing Start
*/


require(['main'], function () {
    require(['jquery', 'tether'], function ($, Tether) {


        // make sure tether is globally availabe for bootstrap
        window.Tether = Tether;
        

        require(['sammy'], function (Sammy) {
		// initialize the application
		var app = Sammy(function () {

			// define a 'route'
			this.get('#/', function () {
				require(['viewHome'], function (view) {
					view.display($('#mainDisplay').empty());
				});
			});


			// load procedure for the myday view
			var myDayDisp = function (dayName) {
				require(['viewMyDay'], function (view) {
					view.display($('#mainDisplay').empty(), dayName);
				});
			};
			// my day Template
			this.get('#/myday/:dayName', function (context) {
				myDayDisp(context.params['dayName']);
			});
			// myDay today
			this.get('#/myday', function () {

				// with a done information is the name the current date
				var today = new Date().toJSON().slice(0, 10).replace(/-/g, '-');        // -- 
				myDayDisp(today);
			});

			this.get('#/list', function () {
				require(['viewInfoTable', 'infoData'], function (view, infoData) {
					infoData.journal().done(function (data) {
						console.log(JSON.stringify(data));
						view.display($('#mainDisplay').empty(), data);
					});
				});
			});

			// get a particular inforamtion
			this.get('#/info/:id', function () {

				var id = this.params["id"];

				require(['viewInfoTable', 'infoData'], function (view, infoData) {

					// display requested information
					infoData.data(id).done(function (data) {
						alert(JSON.stringify(data));
					});

					infoData.journal().done(function (data) {
						// alert(JSON.stringify(data));
						view.display($('#mainDisplay').empty(), data);
					});

				});
			});

			// get a particular inforamtion
			this.get('#/view/:id', function () {

				var id = this.params["id"];

				require(['/scripts/info/views/view' + id + '.js'], function (view) {

					view.display($('#mainDisplay').empty());

				});
			});

			this.get('/#/history', function () {
				require(['/scripts/info/views/viewHistory.js'], function (view) {
					view.display($('#mainDisplay').empty());
				});
			});

			this.get('#/edit', function () {
				require(['viewInfoEdit'], function (editView) {
					editView.display($('#mainDisplay').empty());
				});
			});

			// edit information
			this.get('#/iedit/:id', function () {

				var infoId = this.params["id"];

				require(['viewInfoEdit'], function (editView) {
					editView.display($('#mainDisplay').empty(), infoId);
				});
			});
			
            // Change or enter a new done information 
			this.get('#/done', function () {
			    require(['viewInfoEditDone'], function (editView) {
			        editView.display($('#mainDisplay').empty());
			    });
			});

			// define a 'route'
			this.get('#/hierarchy', function () {
				require(['viewInfoList', 'infoData'], function (view, infoData) {

					infoData.list().done(function (data) {
						console.log(JSON.stringify(data));
						view.display($('#mainDisplay').empty(), data);
						// view.display($('#mainDisplay'), { Id: "testId", Name: "testName", Key: "testKey", Value: "testValue" });
					});
				});
			});
		});

		$(document).ready(
            function () {
                // start the application
                app.run('#/');
            })
        });
    });
});

	




