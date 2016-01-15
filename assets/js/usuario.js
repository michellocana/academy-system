angular.module('adman', ['ui.mask', 'Alertify'])
.controller('usuario', function($scope, $http, $window, Alertify) {

	$scope.matchPassword = function() {
		if($scope.usuario.senha2 !== $scope.usuario.senha){
			$scope.usuario.senha2 = '';
	    	Alertify.error("As senhas precisam combinar.");
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
				usuario: $scope.usuario,
			})
		}).success(function(data){
			if(data.status == 'success'){
		    	Alertify.confirm(data.message)
		    	.then(function () {
		    		console.log('will redirect');
					$window.location.href = '/adman/cliente/cadastro/' + data.idUsuario;
		    	});
			}else{
	    		Alertify.error(data.message);
	    	}	
		}).error(function(data){
	    	Alertify.error(data.message);
		});
	};

	$scope.alterarUsuario = function(isCliente) {
		isCliente = (isCliente) ? "true" : "false";

		$http({
			method: 'POST',
			url: '/adman/usuario/alterar',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: JSON.stringify({
				usuario: 	$scope.usuario,
				isCliente: 	isCliente,
			})
		}).success(function(data){
			if(data.status == 'success'){
		    	Alertify.success(data.message);
			}else{
		    	Alertify.error(data.message);
			}
		}).error(function(data){
	    	Alertify.error(data.message);
		});
	};

	$scope.excluir = function(id, nome, $event) {
		var el = $event.target;

		Alertify.confirm('Deseja excluir ' + nome + '?')
		.then(function () {
			$http({
				method: 'POST',
				url: '/adman/usuario/excluir',
				headers: {
					"Content-Type" :  "application/json"
				},
				data: JSON.stringify({
					idUsuario: id,
				})
			}).success(function(data){
				$(el).parents('tr').fadeOut();
	    		Alertify.success('Usuário ' + nome + ' excluído com sucesso.');
			}).error(function(data){
	      		Alertify.error('Erro ao excluir ' + nome);
			});
        });

	};

	$scope.infoUsuario = function(id, isCliente){
		isCliente = (isCliente) ? "true" : "false";
		
		$http({
			method: 'POST',
			url: '/adman/usuario/infoUsuario/',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: JSON.stringify({
				idUsuario: id,
				isCliente: isCliente,
			})
		}).success(function(data){
			$scope.usuario = data;
		}).error(function(data){
      		Alertify.error('Erro ao lista informações do usuário.');
		});

	};


})