angular
  .module 'ClickLionDocsChanges', []
  .controller 'ChangesController', ['$scope', '$http', ($scope, $http) ->

      $scope.doc = root : 'http://help.clicklion.com'
      $scope.data = []

      $scope.done = (id) ->
        $http { method: 'POST', url: "/changes/#{id}/done" }
          .then (res) ->
            $scope.fetch()

      $scope.fetch = () ->
        $http { method: 'GET', url: '/changes' }
          .then (res) ->
            $scope.data = res.data

      $scope.fetch()

      null

  ]

null