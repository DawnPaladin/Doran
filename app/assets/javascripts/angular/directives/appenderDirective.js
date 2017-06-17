Doran.directive('appender', function() {
  return {
    templateUrl: "/directives/appenderDirective.html",
    restrict: 'E',
    scope: {
      attrName: '@'
    },
    link: function(scope, element, attrs) {
      var input = element[0].querySelector('input');
      new Awesomplete(input, { list: '#mylist' });
    }
  };
});
