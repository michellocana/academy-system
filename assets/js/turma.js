angular.module('adman', ['ui.mask', 'Alertify'])
.controller('turma', function($scope, $http, $window, Alertify) {

	$scope.initTurmas = function(idTurma){
		$scope.turma = new Object();
		$http({
			method: 'POST',
			url: '/adman/turma/initJs',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){
			$scope.aulas = data.aulas;
			$scope.instrutores = data.instrutores;
		});
			
		// Caso for editar
		if(idTurma){
			$scope.getInfo(idTurma);
			$scope.getClientesMatriculados(idTurma);
		}
	};

	$scope.getInfo = function(idTurma){
		$http({
			method: 'POST',
			url: '/adman/turma/getInfo',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: idTurma,
		}).success(function(data){
			$scope.turma = data;
			$scope.statusTurmaTexto = $scope.turma.statusTurmaTexto;
		});	
	};

	$scope.getClientesMatriculados = function(idTurma){
		$http({
			method: 'POST',
			url: '/adman/turma/getClientesMatriculados',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: idTurma,
		}).success(function(data){
			console.log(data)
			$scope.clientes = data;
		});	

		console.log(idTurma);
	};


	$scope.cadastrarTurma = function() {
		console.log($scope.turma);

		$http({
			method: 'POST',
			url: '/adman/turma/cadastrar',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: $scope.turma
		}).success(function(data){
			$window.location.href = '/adman/turma/';
		});
	};

	$scope.alterarTurma = function() {
		$http({
			method: 'POST',
			url: '/adman/turma/alterar',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: $scope.turma
		}).success(function(data){
			$window.location.href = '/adman/turma/';
		});
	};

	$scope.listarTurmas = function(){
		$scope.turma = new Object();

		$http({
			method: 'POST',
			url: '/adman/turma/listarTurmas',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){
			console.log(data);
			$scope.turmas = [];

			for (var i = 0; i < data.length; i++) {
                $scope.turmas[i] = data[i];
            };

		})
	};
}).directive('excluirturma', function($parse, $http, Alertify) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('click', function() {
            	Alertify.confirm('Deseja excluir a turma ' + attrs.sigla + '?')
            	.then(function () {
	                $http({
	                    method: 'POST',
	                    data: attrs.excluirturma,
	                    url: '/adman/turma/excluir',
	                    headers: {
	                        "Content-Type" :  "application/json"
	                    },
	                }).success(function(data){
	                	Alertify.success('Turma excluída com successo');
	                	scope.listarTurmas();
	                })
            	});

            });
        }
    };
}).directive('setaula', function($parse, $http) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('click', function() {
            	scope.$parent.turma.idAula = attrs.setaula;
            	scope.$parent.turma.nomeAula = scope.aula.nomeAula;

                ctrl.$render = function() {
                    elm.html(ctrl.$viewValue);
                };
            });
        }
    };
}).directive('setinstrutor', function($parse, $http) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('click', function() {
            	scope.$parent.turma.idInstrutor = attrs.setinstrutor;
            	scope.$parent.turma.nomeInstrutor = scope.instrutor.nomeInstrutor;

                ctrl.$render = function() {
                    elm.html(ctrl.$viewValue);
                };
            });
        }
    };
}).directive('setstatus', function($parse, $http) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('click', function() {
            	scope.turma.statusTurma = attrs.setstatus;
            	scope.statusTurmaTexto = elm.text();

                ctrl.$render = function() {
                    elm.html(ctrl.$viewValue);
                };
            });
        }
    };
}).directive('updatestatus', function($parse, $http) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('click', function() {
            	scope.turma.statusTurma = attrs.updatestatus;

            	dataUpdateStatusTurma = {
            		idTurma: scope.turma.idTurma,
            		statusTurma: scope.turma.statusTurma,
            	};

            	$http({
            		method: 'POST',
            		data: dataUpdateStatusTurma,
            		url: '/adman/turma/updateStatus',
            		headers: {
            			"Content-Type" :  "application/json"
            		},
            	})

                ctrl.$render = function() {
                    elm.html(ctrl.$viewValue);
                };
            });
        }
    };
})