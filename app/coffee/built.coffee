angular.module 'baseApp', [
	'ui.bootstrap'
	'baseApp.config'
	'baseApp.factory.page'
	'baseApp.factory.data'
	'baseApp.controller.mainCtrl'
	'baseApp.controller.helloCtrl'
	'baseApp.controller.dataCtrl'
	'baseApp.controller.uiBootstrapCtrl'
]

angular.module 'baseApp.config', ['ngRoute']
.config ($routeProvider) ->
	$routeProvider
	.when '/', templateUrl: 'app/views/default.html'
	.when '/hello', templateUrl: 'app/views/hello.html'
	.when '/data', templateUrl: 'app/views/data.html'
	.when '/uiBootstrap', templateUrl: 'app/views/uiBootstrap.html'
	.otherwise redirectTo: '/'
angular.module 'baseApp.factory.data', []
.factory 'Data', ($http)->
	myData = {
		async: ()->
			promise = $http.get('https://mnk-plan.firebaseio.com/projects.json').then (resp)->
				console.log resp
				resp.data
			return promise
	}

angular.module 'baseApp.factory.page', []
.factory 'Page', ()->
	title = ""
	title: ()->
		title
	setTitle: (newTitle)->
		title = newTitle
angular.module 'baseApp.controller.dataCtrl', [
	'baseApp.factory.page'
	'baseApp.factory.data'
]
.controller "DataCtrl", ($scope,Page, Data, $interval)->
	$scope.title = Page.setTitle('Data')
	$scope.text = 'Data Example Page'
	$scope.min = 0
	$scope.loading = ()->
		$interval ()->
	        if $scope.min < 100
	            $scope.min = $scope.min + 10
	        
	    , 500
		setTimeout ()->
			$scope.h = true
			$scope.$apply ()->
				Data.async().then (d)->
					$scope.data = d
		, 6000

	$scope.loading()

angular.module 'baseApp.controller.helloCtrl', ['baseApp.factory.page']
.controller "HelloCtrl", ($scope, Page )->
	$scope.title = Page.setTitle('Hello')
	$scope.hello = 'Hello Page'
	$scope.fruits=[
		{
			"id": 1
			"name": 'apple'
		},
		{
			"id": 2
			"name": 'Banana'
		},
		{
			"id": 3
			"name": 'mango'
		}
	]
	$scope.addFruit = ()->
        $scope.fruits.push({"id": $scope.fruits.length + 1,"name": $scope.newFruit})
        $scope.newFruit = ''



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
angular.module 'baseApp.controller.uiBootstrapCtrl', ['baseApp.factory.page']
.controller "UiBootstrapCtrl", ($scope,Page,$modal)->
	$scope.title = Page.setTitle('Ui Bootstrap')
	$scope.hello = 'Ui Bootstrap'

	$scope.open = ()->
		modalInstance = $modal.open({
			templateUrl: 'myModalContent'
		})

