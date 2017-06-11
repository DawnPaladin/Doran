Doran.factory('championService', ['Restangular', function(Restangular) {
  var exports = {};

  // var champions = Restangular.all('champions');
  // champions.getList().then(function(champions) {
  //   exports.champions = champions;
  //   console.log(champions);
  // });

  exports.getAll = function() {
    return Restangular.all('champions').getList();
  };

  return exports;
}]);
