describe "DataCtrl", ->
  beforeEach angular.mock.module("baseApp")
  beforeEach angular.mock.module("ngRoute")
  beforeEach angular.mock.inject(($rootScope, $controller, Data) ->
    @scope = $rootScope.$new()
    $controller "DataCtrl",{
    	$scope: @scope
    }
    
  )

  it "should assign data to data", ->
    expect(@scope.text).toBe 'Data Example Page'

