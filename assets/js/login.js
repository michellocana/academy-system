angular.module('adman', [])
.controller('login', function($scope, $http, $window) {
	$scope.loginMessage = "Login";
	
	$scope.login = function() {
		$http({
			method: 'POST',
			url: '/adman/login/login',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: JSON.stringify({
				nickname: 	$scope.login.nickname,
				senha: 		$scope.login.senha,
			})
		}).success(function(data){
			if(data.status == 'success'){
				var url = "http://" + $window.location.host + "/adman";
				$window.location.href = url;
			}else{
				$scope.loginMessage = data.message;
			}
		});
	};


})