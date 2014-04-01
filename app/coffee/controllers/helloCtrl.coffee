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


