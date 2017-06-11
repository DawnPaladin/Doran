Doran.controller('ChampionCtrl', ['$scope', 'championService', function($scope, championService) {
  $scope.champions = championService.champions;
}]);
