angular.module('adman', ['ui.mask', 'Alertify'])
.controller('cliente', function($scope, $http, $window, Alertify) {

	$scope.cadastrarCliente = function() {
		$scope.cliente.idUsuario = $scope.idUsuario;
		// console.log($scope.cliente);
		// return;
		$http({
			method: 'POST',
			url: '/adman/cliente/cadastrar',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: JSON.stringify({
				cliente: $scope.cliente,
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

	$scope.setIdUsuario = function(idUsuario){
		$scope.idUsuario = idUsuario;
	};

})