
// requirejs configuration
requirejs.config({
    paths: {
        /* Load jquery from google cdn. On fail, load local file. */
        // 'jquery': ['//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min', '/scripts/jquery-1.9.1'],
        'jquery': ['/scripts/lib/jquery-1.9.1'],
        /* Load bootstrap from cdn. On fail, load local file. */
        // 'bootstrap': ['https://maxcdn.botstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min'],

        'bootstrap': ['/scripts/lib/bootstrap-4.0.0-alpha.6/bootstrap-4.0.0-alpha.6/dist/js/bootstrap.min'],


        'sinon': ['/scripts/sinon-1.9.1'],
        'jsrender': ['/scripts/lib/jsrender.min']   ,
        'router': ['/scripts/info/router']           ,
        'sammy': ['/scripts/sammy-0.7.5.min'],
        'infoForm': ['/scripts/info/infoForm']      ,
        'infoStore': ['/scripts/info/infoStore']    ,
        'infoConfig': ['/scripts/info/infoConfig']  ,
        'infoData': ['/scripts/info/infoData'],
        'infoMockData': ['/scripts/info/infoMockData'],
        'amplify': ['/scripts/amplify.min'],
        'viewInfoEdit': ['/scripts/info/views/viewInfoEdit'],
        'viewInfoEditDone': ['/scripts/info/views/viewInfoEditDone'],
        'viewInfoTable': ['/scripts/info/views/viewInfoTable'],
        'viewInfoSave': ['/scripts/info/views/viewInfoSave'],
		'viewInfoList': ['/scripts/info/views/viewInfoList'],
		'viewInfoProgress': ['/scripts/info/views/viewInfoProgress'],
		'viewHistory': ['/scripts/info/views/viewHistory'],
		'viewHome': ['/scripts/info/views/viewHome'],
		'viewInfoGrid': ['/scripts/info/views/viewInfoTable'],
		'tether': ['/scripts/lib/tether-1.3.3/dist/js/tether.min']
    },
    shim: {
        /* Set bootstrap dependencies (just jQuery) */
        'bootstrap': {
            deps: ["jquery", 'tether']
        },
        'jsrender': ['jquery'],
        'sammy': {
            deps: ["jquery"],
            exports: "sammy"
        },
        'amplify': {
            deps: ["jquery"],
            exports: "amplify"
        }
    }
});


