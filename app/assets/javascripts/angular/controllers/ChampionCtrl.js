Doran.controller('ChampionCtrl', ['$scope', 'championService', function($scope, championService) {
  championService.getAll().then(function(champions) {
    $scope.champions = champions;
    console.log(champions);
  });
}]);
