describe "MainCtrl", ->
  beforeEach angular.mock.module("baseApp")
  beforeEach angular.mock.module("ngRoute")
  beforeEach angular.mock.module("ui.bootstrap")
  beforeEach angular.mock.inject(($rootScope, $controller) ->
    @scope = $rootScope.$new()
    $controller "MainCtrl",{
    	$scope: @scope
    }
    
  )

  it "should assign 'Wah Gwon ' to greeting", ->
    expect(@scope.greeting).toBe "Wah Gwon word!"

