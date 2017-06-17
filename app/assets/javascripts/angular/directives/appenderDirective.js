Doran.directive('appender', function() {
  return {
    templateUrl: "/directives/appenderDirective.html",
    restrict: 'E',
    scope: {
      attrName: '@'
    }
  };
});
