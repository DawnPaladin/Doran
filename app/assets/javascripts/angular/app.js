var Doran = angular.module('Doran', ['restangular', 'ui.router']);

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
}]);

Doran.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise('/champions');
  $stateProvider
    .state('champions', {
      url: '/champions',
      templateUrl: "templates/champions/index.html",
      controller: "ChampionCtrl"
    });
}]); // TODO: use `resolve` to load champion data

Doran.run(['$rootScope', function($rootScope) {
  $rootScope.$on('$stateChangeError', console.warn.bind(console));
}]);
