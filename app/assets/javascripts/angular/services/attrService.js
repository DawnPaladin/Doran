Doran.factory('attrService', ['Restangular', '$q', function(Restangular, $q) {
  var exports = {};

  var _strengths = [];
  var _fetching = false;
  exports.getStrengths = function() {
    if (_strengths.length || _fetching) { return $q.when(_strengths); }
    else {
      _fetching = true;
      return Restangular.all('strengths').getList()
        .then(function(strengths) {
          angular.copy(strengths, _strengths);
          return _strengths;
        });
    }
  };

  return exports;
}]);
