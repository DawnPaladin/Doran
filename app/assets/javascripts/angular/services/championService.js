Doran.factory('championService', ['Restangular', function(Restangular) {
  var exports = {};

  exports.getAll = function() {
    return Restangular.all('champions').getList();
  };

  return exports;
}]);
