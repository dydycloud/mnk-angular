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
