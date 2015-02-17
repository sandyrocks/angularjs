angular
    .module('JwtWebTokens', [
        'ngRoute',
        'templates'
    ]).config(function ($routeProvider, $locationProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'login.html',
                controller: 'LoginCtrl'
            })
            .when('/signup', {
              templateUrl: 'signup.html',
              controller: 'SignupCtrl'  
            })
            .when('/posts', {
              templateUrl: 'post.html',
              controller: 'PostCtrl'  
            })
        $locationProvider.html5Mode(true);
    });
