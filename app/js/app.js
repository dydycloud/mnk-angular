(function() {
  angular.module('baseApp', ['ui.bootstrap', 'baseApp.config', 'baseApp.factory.page', 'baseApp.factory.data', 'baseApp.controller.mainCtrl', 'baseApp.controller.helloCtrl', 'baseApp.controller.dataCtrl', 'baseApp.controller.uiBootstrapCtrl']);

  angular.module('baseApp.config', ['ngRoute']).config(function($routeProvider) {
    return $routeProvider.when('/', {
      templateUrl: 'app/views/default.html'
    }).when('/hello', {
      templateUrl: 'app/views/hello.html'
    }).when('/data', {
      templateUrl: 'app/views/data.html'
    }).when('/uiBootstrap', {
      templateUrl: 'app/views/uiBootstrap.html'
    }).otherwise({
      redirectTo: '/'
    });
  });

  angular.module('baseApp.factory.data', []).factory('Data', function($http) {
    var myData;
    return myData = {
      async: function() {
        var promise;
        promise = $http.get('https://mnk-plan.firebaseio.com/projects').then(function(resp) {
          console.log(resp);
          return resp.data;
        });
        return promise;
      }
    };
  });

  angular.module('baseApp.factory.page', []).factory('Page', function() {
    var title;
    title = "";
    return {
      title: function() {
        return title;
      },
      setTitle: function(newTitle) {
        return title = newTitle;
      }
    };
  });

  angular.module('baseApp.controller.dataCtrl', ['baseApp.factory.page', 'baseApp.factory.data']).controller("DataCtrl", function($scope, Page, Data, $interval) {
    $scope.title = Page.setTitle('Data');
    $scope.text = 'Data Example Page';
    $scope.min = 0;
    $scope.loading = function() {
      $interval(function() {
        if ($scope.min < 100) {
          return $scope.min = $scope.min + 10;
        }
      }, 500);
      return setTimeout(function() {
        $scope.h = true;
        return $scope.$apply(function() {
          return Data.async().then(function(d) {
            return $scope.data = d;
          });
        });
      }, 6000);
    };
    return $scope.loading();
  });

  angular.module('baseApp.controller.helloCtrl', ['baseApp.factory.page']).controller("HelloCtrl", function($scope, Page) {
    $scope.title = Page.setTitle('Hello');
    $scope.hello = 'Hello Page';
    $scope.fruits = [
      {
        "id": 1,
        "name": 'apple'
      }, {
        "id": 2,
        "name": 'Banana'
      }, {
        "id": 3,
        "name": 'mango'
      }
    ];
    return $scope.addFruit = function() {
      $scope.fruits.push({
        "id": $scope.fruits.length + 1,
        "name": $scope.newFruit
      });
      return $scope.newFruit = '';
    };
  });

  angular.module('baseApp.controller.mainCtrl', ['baseApp.factory.page']).controller("MainCtrl", function($scope, Page) {
    $scope.title = Page.setTitle('Base App');
    $scope.menu = {
      hello: {
        link: "#/hello",
        title: "Hello"
      },
      data: {
        link: "#/data",
        title: "Data"
      },
      uiBootstrap: {
        link: "#/uiBootstrap",
        title: "Ui-Bootstrap"
      }
    };
    return $scope.greeting = "Wah Gwon word!";
  });

  angular.module('baseApp.controller.uiBootstrapCtrl', ['baseApp.factory.page']).controller("UiBootstrapCtrl", function($scope, Page, $modal) {
    $scope.title = Page.setTitle('Ui Bootstrap');
    $scope.hello = 'Ui Bootstrap';
    return $scope.open = function() {
      var modalInstance;
      return modalInstance = $modal.open({
        templateUrl: 'myModalContent'
      });
    };
  });

}).call(this);
