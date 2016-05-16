

// Returns data on request
// utilized by: router
define(['jquery', 'infoConfig'], function ($, iConfig) {

    var infoList = function () {
        var action = iConfig.serviceURL + "/info";
        return $.ajax({ url: action, type: "GET", contentType: "application/json;charset=utf-8" });
    };
    var history = function () {
    	var action = iConfig.serviceURL + "/infohistory";
    	return $.ajax({ url: action, type: "GET", contentType: "application/json;charset=utf-8" });
    };

    var infoRoot = function () {
    	var action = iConfig.serviceURL + "/info/0/journal";
    	return $.ajax({ url: action, type: "GET", contentType: "application/json;charset=utf-8" });
    };
    var infoJournal = function () {
        var action = iConfig.serviceURL + "/info/0/journal";
        return $.ajax({ url: action, type: "GET", contentType: "application/json;charset=utf-8" });
    };
    var data = function (id) {
        var action = iConfig.serviceURL + "/info/" + id;
        return $.ajax({ url: action, type: "GET", contentType: "application/json;charset=utf-8" });
    };
    var del = function (id) {
        var action = iConfig.serviceURL + "/info/" + id;
        return $.ajax({ url: action, type: "DELETE", contentType: "application/json;charset=utf-8" });
    };
    var update = function (parentId, info) {

        // just return the ajax promise
        // call: $.when(iData.update(Id, info)).then(function (data) {});
        var action = iConfig.serviceURL + "/info/" + parentId;
        return $.ajax({ url: action, type: "PUT", datatype: "json" , data : info });
    };
    var create = function (id, info) {
        var action = iConfig.serviceURL + "/info/" + id;
           return $.ajax({ url: action, type: "POST", datatype: "json" , data : info });
    };
    return {
		history: history		,
        list: infoList          ,
        journal: infoJournal    ,
        delete: del             ,
        update: update          ,
        create: create          ,
        data: data
    }
});

