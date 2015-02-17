angular.module('JwtWebTokens')
    .controller('PostCtrl', function ($scope,$http,$rootScope) {
    	$scope.posts = [];
        $http.get("/api/posts?token="+ $rootScope.token).success(function(all_post) {
      	   $scope.posts.push(all_post)		
    	});

    	$scope.edit = function(post) {
    		
    	}
 });