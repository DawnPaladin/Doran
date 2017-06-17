Doran.directive('addable', function() {
  return {
    templateUrl: '/directives/addableDirective.html',
    restrict: 'E',
    scope: {
      strength: '='
    }
  };
});
