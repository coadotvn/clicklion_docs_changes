// Generated by CoffeeScript 1.9.1
(function() {
  angular.module('ClickLionDocsChanges', []).controller('ChangesController', [
    '$scope', '$http', function($scope, $http) {
      $scope.doc = {
        root: 'http://help.clicklion.com'
      };
      $scope.data = [];
      $scope.done = function(id) {
        return $http({
          method: 'POST',
          url: "/changes/" + id + "/done"
        }).then(function(res) {
          return $scope.fetch();
        });
      };
      $scope.fetch = function() {
        return $http({
          method: 'GET',
          url: '/changes'
        }).then(function(res) {
          return $scope.data = res.data;
        });
      };
      $scope.fetch();
      return null;
    }
  ]);

  null;

}).call(this);
