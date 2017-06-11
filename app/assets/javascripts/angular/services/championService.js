Doran.factory('championService', ['Restangular', function(Restangular) {
  var exports = {};

  var champions = Restangular.all('champions');
  champions.getList().then(function(champions) {
    exports.champions = champions;
    console.log(champions);
  });

  return exports;
}]);
