Doran.factory('attrService', ['Restangular', '$q', function(Restangular, $q) {
  var _attrs = {
    strengths: [],
    weaknesses: [],
  };
  var _fetching = {
    strengths: false,
    weaknesses: false,
  };
  var getAttrList = function(attrName) {
    if (_attrs[attrName].length) {
      return $q.when(_attrs[attrName]);
    }
    else if (_fetching[attrName]) {
      return new Promise(function(resolve, reject) {
        (function wait() {
          if (_attrs[attrName].length) return resolve(_attrs[attrName]);
          setTimeout(wait, 500);
        })();
      });
    } else {
      _fetching[attrName] = true;
      return Restangular.all(attrName).getList()
        .then(function(receivedAttrList) {
          _attrs[attrName] = receivedAttrList;
          return _attrs[attrName];
        });
    }
  };

  return {
    getAttrList,
  };
}]);
