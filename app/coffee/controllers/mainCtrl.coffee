angular.module 'baseApp.controller.mainCtrl', ['baseApp.factory.page']
.controller "MainCtrl", ($scope,Page )->
	$scope.title = Page.setTitle('Base App')
	$scope.menu = {
		hello: {
			link: "#/hello"
			title: "Hello"
		},
		data: {
			link: "#/data"
			title: "Data"
		},
		uiBootstrap: {
			link: "#/uiBootstrap"
			title: "Ui-Bootstrap"
		},
	}
	$scope.greeting = "Wah Gwon word!"