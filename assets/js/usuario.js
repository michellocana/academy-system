angular.module('adman', ['ui.mask'])
.controller('usuario', function($scope, $http) {

	$scope.matchPassword = function() {
		if($scope.usuario.senha2 !== $scope.usuario.senha){
			$scope.usuario.senha2 = '';
			alert('as senhas tem que combinar.');
		}
	};

	$scope.cadastrarUsuario = function() {
		$http({
			method: 'POST',
			url: '/adman/usuario/cadastrar',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: JSON.stringify({
				nome: 			$scope.usuario.nome,
				sobrenome: 		$scope.usuario.sobrenome,
				nickname: 		$scope.usuario.nickname,
				dtNascimento: 	$scope.usuario.dtNascimento,
				email: 			$scope.usuario.email,
				cpf: 			$scope.usuario.cpf,
				file: 			"",
				senha: 			$scope.usuario.senha,
			})
		}).success(function(data){
			alert(data.message);
		});
	};

})