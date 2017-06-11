var Doran = angular.module('Doran', ['restangular']);

Doran.config(
  ["$httpProvider",
    function($httpProvider) {
      var token = $('meta[name=csrf-token]')
        .attr('content');
      $httpProvider
        .defaults
        .headers
        .common['X-CSRF-Token'] = token;
    }
  ]
);

Doran.config(['RestangularProvider', function(RestangularProvider) {
  RestangularProvider.setBaseUrl('/api/v1');
  RestangularProvider.setRequestSuffix('.json');
  RestangularProvider.setDefaultHttpFields({
      "content-type": "application/json"
  });
}])
