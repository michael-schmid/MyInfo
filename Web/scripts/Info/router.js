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
            	require(['viewInfoGrid', 'infoData'], function (view, infoData) {


            		infoData.data(0).done(function (data) {
            			alert(JSON.stringify(data));
            			view.display($('#infoList'), data);
            		});

                    //infoData.journal().done(function (data) {
                    //    // console.log(JSON.stringify(data));
                    //    view.display($('#infoList'), data);
                    //    // view.display($('#main'), { Id: "testId", Name: "testName", Key: "testKey", Value: "testValue" });
                    //});
                });

                // edit form
                require(['viewInfoEdit'], function (editView) {
                    editView.display($('#infoEdit'));
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



			// grid for info and childinfos
            this.get('#/info/:id', function () {

                var id = this.params["id"];

                require(['viewInfoGrid', 'infoData'], function (view, infoData) {

                	infoData.data(id).done(function (data) {
                		alert(JSON.stringify(data));
                		view.display($('#infoList'), data);
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

    

    


