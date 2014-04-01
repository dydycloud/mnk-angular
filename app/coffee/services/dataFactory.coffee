angular.module 'baseApp.factory.data', []
.factory 'Data', ($http)->
	myData = {
		async: ()->
			promise = $http.get('app/data/data.json').then (resp)->
				console.log resp
				resp.data
			return promise
	}
