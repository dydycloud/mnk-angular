angular.module 'baseApp.config', ['ngRoute']
.config ($routeProvider) ->
	$routeProvider
	.when '/', templateUrl: 'app/views/default.html'
	.when '/hello', templateUrl: 'app/views/hello.html'
	.when '/data', templateUrl: 'app/views/data.html'
	.when '/uiBootstrap', templateUrl: 'app/views/uiBootstrap.html'
	.otherwise redirectTo: '/'