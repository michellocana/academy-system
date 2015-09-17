angular.module('academyApp', [])
.controller('usuarioController', function($scope, $http) {

	$scope.matchPassword = function() {
		if($scope.usuario.dsPassword2 !== $scope.usuario.dsPassword){
			$scope.usuario.dsPassword2 = '';
			alert('as senhas tem que combinar.');
		}
	};

	$scope.cadastrarUsuario = function() {
		$http({
			method: 'POST',
			url: '/academy-system/usuario/cadastrar',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: JSON.stringify({
				dsNome: 		$scope.usuario.dsNome,
				dsSobrenome: 	$scope.usuario.dsSobrenome,
				dsNickname: 	$scope.usuario.dsNickname,
				dtNascimento: 	$scope.usuario.dtNascimento,
				dsPassword: 	$scope.usuario.dsPassword,
			})
		}).success(function(data){
			alert(data.message);
		});
	};

})