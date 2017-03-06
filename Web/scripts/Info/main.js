
// requirejs configuration
requirejs.config({
    paths: {
        /* Load jquery from google cdn. On fail, load local file. */
        // 'jquery': ['//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min', '/scripts/jquery-1.9.1'],
        'jquery': ['/scripts/lib/jquery-1.9.1'],
        /* Load bootstrap from cdn. On fail, load local file. */
        //'bootstrap': ['//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min', '/bootstrap/css/bootstrap-min'],
        'bootstrap': ['/bootstrap/css/bootstrap-min'],

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
		'viewInfoTable': ['/scripts/info/views/viewInfoTable'],
		'viewInfoList': ['/scripts/info/views/viewInfoList'],
		'viewInfoProgress': ['/scripts/info/views/viewInfoProgress'],
		'viewHistory': ['/scripts/info/views/viewHistory'],
		'viewHome': ['/scripts/info/views/viewHome'],
		'viewInfoGrid': ['/scripts/info/views/viewInfoTable']
    },
    shim: {
        /* Set bootstrap dependencies (just jQuery) */
        'bootstrap': ['jquery'],
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

