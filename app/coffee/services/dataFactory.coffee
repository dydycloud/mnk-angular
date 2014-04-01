angular.module 'baseApp.factory.data', []
.factory 'Data', ($http)->
	myData = {
		async: ()->
			promise = $http.get('https://mnk-plan.firebaseio.com/projects').then (resp)->
				console.log resp
				resp.data
			return promise
	}
