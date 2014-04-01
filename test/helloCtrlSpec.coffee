describe "HelloCtrl", ->
  beforeEach angular.mock.module("baseApp")
  beforeEach angular.mock.module("ngRoute")
  beforeEach angular.mock.inject(($rootScope, $controller) ->
    @scope = $rootScope.$new()
    $controller "HelloCtrl",{
    	$scope: @scope
    }
    
  )

  it "should assign 'Hello' to title", ->
    expect(@scope.title).toBe "Hello"

  it "should assign 'Hello Page' to hello", ->
    expect(@scope.hello).toBe "Hello Page"

