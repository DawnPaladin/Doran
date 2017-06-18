Doran.directive('appender', ['attrService', function(attrService) {
  return {
    templateUrl: "/directives/appenderDirective.html",
    restrict: 'E',
    scope: {
      attrName: '@',
    },
    link: function(scope, element, attrs) {
      var input = element[0].querySelector('input');
      attrService.getStrengths().then((receivedStrengths) => {
        new Awesomplete(input, { list: receivedStrengths.map((rcStr) => rcStr.name) });
      });
    }
  };
}]);
