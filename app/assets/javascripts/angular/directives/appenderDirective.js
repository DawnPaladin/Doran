Doran.directive('appender', ['attrService', function(attrService) {
  return {
    templateUrl: "/directives/appenderDirective.html",
    restrict: 'E',
    scope: {
      attrName: '@',
      attrPlural: '@',
    },
    link: function(scope, element, attrs) {
      var input = element[0].querySelector('input');
      attrService.getAttrList(attrs.attrPlural).then((receivedAttrList) => {
        var attrList = receivedAttrList.map((rcAttr) => rcAttr.name);
        new Awesomplete(input, { list: attrList });
      });
    }
  };
}]);
