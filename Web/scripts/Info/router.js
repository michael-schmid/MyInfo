/// <reference path="infoData.js" />

/*
        Routing Start
*/

require(['/scripts/main.js'], function () {
	require(['sammy'], function (Sammy) {
		// initialize the application
		var app = Sammy('#main', function () {

			// define a 'route'
			this.get('#/', function () {
				require(['viewHome'], function (view) {
					view.display($('#main'));
				});
			});

			this.get('#/list', function () {
				require(['viewInfoTable', 'infoData'], function (view, infoData) {
					infoData.journal().done(function (data) {
						console.log(JSON.stringify(data));
						view.display($('#main'), data);
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
						view.display($('#main'), data);
					});

				});
			});


			// get a particular inforamtion
			this.get('#/view/:id', function () {

				var id = this.params["id"];

				require(['view' + id], function (view) {

					view.display($('#main'));

				});
			});


			this.get('/#/history', function () {
				require(['/scripts/info/views/viewHistory.js'], function (view) {
					view.display($('#main'));
				});
			});

			this.get('#/edit', function () {
				require(['viewInfoEdit'], function (editView) {
					editView.display($('#main'));
				});
			});

			// define a 'route'
			this.get('#/hierarchy', function () {
				require(['viewInfoList', 'infoData'], function (view, infoData) {

					infoData.list().done(function (data) {
						console.log(JSON.stringify(data));
						view.display($('#main'), data);
						// view.display($('#main'), { Id: "testId", Name: "testName", Key: "testKey", Value: "testValue" });
					});
				});
			});
		});
		// start the application
		app.run('#/');
	});
});






