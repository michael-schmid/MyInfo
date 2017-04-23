

// Returns data on request
// utilized by: router
define(['jquery', 'infoConfig'], function ($, iConfig) {

	var info = function () {
		return [
			{
				bootstrap: {
					modal: [{
						"small and large display": [
								'modal-lg', 'modal-sm', 'set on the modal-dialog'
						]
					},
						"https://v4-alpha.getbootstrap.com/components/modal/",

					]
				}
			}
		]
	};

    return {
		info: info
    }
});

