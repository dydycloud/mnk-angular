angular.module 'baseApp.controller.uiBootstrapCtrl', ['baseApp.factory.page']
.controller "UiBootstrapCtrl", ($scope,Page,$modal)->
	$scope.title = Page.setTitle('Ui Bootstrap')
	$scope.hello = 'Ui Bootstrap'

	$scope.open = ()->
		modalInstance = $modal.open({
			templateUrl: 'myModalContent'
		})

