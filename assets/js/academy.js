$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});

angular.module('academyApp', [])
.controller('academyController', function($scope, $http) {
	$scope.academy = new Object();
	$scope.academy.dsNome = 'dsNome';
	$scope.academy.dsSobrenome = 'dsSobrenome';
	$scope.academy.dsNickname = 'dsNickname';
	$scope.academy.dtNascimento = '12/12/1212';
	$scope.academy.password = 'password';
	$scope.academy.password2 = 'password';
	$scope.academy.teste = 'teste';

	$scope.matchPassword = function() {
		if($scope.academy.password2 !== $scope.academy.password){
			$scope.academy.password2 = '';
			alert('as senhas tem que combinar.');
		}
	};

	$scope.post = function() {
		// $http({
		// 	method: 'POST',
		// 	url: 'http://localhost/academy-system/usuario/cadastrar/', 
		// 	data: $scope.academy,
  //       	headers: {'Content-Type': 'application/json'},
		// }).
		// then(function(response) {
		// 	$scope.academy.teste = response.data;
		// });
		$http({
			method : 'POST',
			url: 'http://localhost/academy-system/usuario/cadastrar/', 
			headers: {'Content-Type': 'application/json'},
			data : JSON.stringify($scope.academy)
		}).success(function(response) {
			debugger;
			$scope.academy.teste = response.data;
		});
	};

})