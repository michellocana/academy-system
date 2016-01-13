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
			componentHandler.upgradeAllRegistered();
		});
			
		// Caso for editar
		if(idTurma){
			$scope.getInfo(idTurma);
			$scope.getClientesMatriculados(idTurma);
			$scope.getClientesNaoMatriculados(idTurma);
		}

	};

	$scope.addCheckboxListener = function(){
		MaterialDataTable.prototype.addEventListener = function(type, listener) {
			'use strict';

			var table = document.getElementById('tableClientesMatriculados');
			var checkboxes = table.querySelector('tbody').querySelectorAll('.mdl-checkbox__input');
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].addEventListener(type, listener);
			}
		};

		MaterialDataTable.prototype.addEventListener('change', $scope.updateSelected);

	};

	$scope.addSelectAllListener = function(){
		MaterialDataTable.prototype.addEventListener = function(type, listener) {
			'use strict';

			var table = document.getElementById('tableClientesMatriculados');

			var checkboxes = table.querySelector('thead').querySelectorAll('.mdl-checkbox__input');

			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].addEventListener(type, listener);
			}
		};

		MaterialDataTable.prototype.addEventListener('change', $scope.selectAllToggle);

	};

	$scope.selectAllToggle = function(event){
		// Clearing array
		$scope.selected = [];

		// Updating array if checkbox is checked
		if (event.target.checked) {
			for (var i = 0; i < $scope.clientes.length; i++) {
				currentId = $scope.clientes[i].idTurmaCliente;
				currentId = parseInt(currentId);
				$scope.selected.push(currentId);
			};
	    }
	}

	$scope.updateSelected = function(event){
		// Getting current scope
		var scope = angular.element($(this)).scope();

		currentId = parseInt(scope.cliente.idTurmaCliente);

		// Updating array
		if (event.target.checked) {
			$scope.selected.push(currentId);
	    }else{
			index = $scope.selected.indexOf(currentId);
			$scope.selected.splice(index, 1);
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
			$scope.clientes = data;

            setTimeout(function(){
                // Fixing data table bug after table is updated
                $('.mdl-data-table').removeAttr('data-upgraded').removeClass('is-upgraded');
                $('.mdl-data-table').find('th .mdl-data-table__select').parent().remove();
                $('.mdl-data-table').find('td .mdl-data-table__select').parent().remove();
                componentHandler.upgradeDom('MaterialSwitch');
                componentHandler.upgradeDom('MaterialDataTable');
                componentHandler.upgradeAllRegistered();

                // Adding change listener to table checkboxes
				$scope.selected = [];
                $scope.addCheckboxListener();
                $scope.addSelectAllListener();

            },0);

            console.log($scope.clientes);

		});	
	};

	$scope.getClientesNaoMatriculados = function(idTurma){
		$scope.clientesMatriculas = new Object();

		$http({
			method: 'POST',
			url: '/adman/turma/getClientesNaoMatriculados',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: idTurma,
		}).success(function(data){
			componentHandler.upgradeAllRegistered();
			console.log(data);
			$scope.clientesMatriculas = data;
		});	
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

	$scope.addMatriculaCliente = function(idTurma){
		$http({
			method: 'POST',
			url: '/adman/turma/addMatriculaCliente',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: idTurma
		}).success(function(data){
			console.log(data);

			$scope.getClientesMatriculados($scope.turma.idTurma);
		})
	};

	$scope.updateAutocomplete = function(){
		// Getting current scope
		var target = $(event.target);
		var scope = angular.element(target).scope();


		listItems = $(target).parent().find('.mdl-menu li');
		heightDecrease = 0;
		menu = $(target).parent().find('.mdl-menu');
		matchesCount = 0;

		search = target.text();

		for (var i = 0; i < listItems.length; i++) {
			text = $(listItems[i]).find('a').text();

			currentLi = $(listItems[i]);

			if(search.substr(search.length - 1).match(/\s/g)){
				search = search.substr(0, search.length - 1);
			}

			if(text.indexOf(search) > -1){
				currentLi.css('display', 'block');
				menu.closest('.mdl-menu__container').height(menu.innerHeight());
				matchesCount++;
			}else{
				currentLi.css('display', 'none');
				menu.closest('.mdl-menu__container').height(menu.innerHeight());
			}

		}

		if(matchesCount == 0){
			menu.addClass('no-results');
			menu.append('<li class="alert-message">Sem resultados</li>')
			menu.closest('.mdl-menu__container').height(menu.innerHeight());
		}else{
			menu.removeClass('no-results');
			menu.find('li.alert-message').remove();
		}

	};

	$scope.clearInput = function(){
		// Getting current scope
		var target = $(event.target);

		
		if(target.is('input') || target.is('textarea')) 
			target.val('');
		else
			target.text('');

		target.on('focusout', function(){
			if(target.text().length < 1 || target.val().length < 1){
				target.text('Nome do cliente').val('Nome do cliente');
			}
		});

	};

	$scope.excluirMatriculaCliente = function(){
    	if($scope.selected.length > 0){
    		if($scope.selected.length == 1){
    			index = $scope.selected[0];

    			for (var i = 0; i < $scope.clientes.length; i++) {
    				if($scope.clientes[i].idTurmaCliente == index){
    					nomeCliente = $scope.clientes[i].nomeCliente;
    				}
    			};

    			message = 'Deseja cancelar a matrícula de "' + nomeCliente + '"?';
    			messageSuccess = 'A matrícula de "' + nomeCliente + '" foi cancelada.';

    		}else{
    			message = 'Deseja cancelar as matrículas de ' + $scope.selected.length + ' clientes?';
    			messageSuccess = $scope.selected.length + ' clientes tiveram as matrículas canceladas.';
    		}

	    	Alertify.confirm(message)
			.then(function(){
		        $http({
		            method: 'POST',
		            url: '/adman/turma/excluirMatriculaCliente',
		            data: {
		            	clientes: $scope.selected,
		            	idTurma: parseInt($scope.turma.idTurma)
		            },
		            headers: {
		                'Content-Type': 'application/json'
		            }
		        }).success(function(data){
		        	$scope.selected = [];

		        	console.log($scope.selected);

					$scope.getClientesMatriculados($scope.turma.idTurma);
					$scope.getClientesNaoMatriculados($scope.turma.idTurma);

		        	Alertify.success(messageSuccess);
		        });
			});
    	}else{
			Alertify.error('Selecione um ou mais equipamentos para excluir');
    	}
    }

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
            	scope.$parent.turma.nomeCliente = scope.instrutor.nomeCliente;

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
}).directive('updateturmacliente', function($parse, $http, Alertify) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('click', function() {

            	dataUpdateTurmaCliente = {
	            	idCliente: attrs.updateturmacliente,	
	            	idTurmaCliente: scope.$parent.cliente.idTurmaCliente
            	};

            	$http({
            		method: 'POST',
            		data: dataUpdateTurmaCliente,
            		url: '/adman/turma/updateTurmaCliente',
            		headers: {
            			"Content-Type" :  "application/json"
            		},
            	}).success(function(data){
                	Alertify.success('Aluno matrículado com sucesso.');

                	scope.$parent.cliente = data;

                	console.log('ma oe ' + scope.$parent.clientes);

	                ctrl.$render = function() {
	                    elm.html(ctrl.$viewValue);
	                };

	                idTurma = scope.$parent.turma.idTurma;

	            	scope.$parent.$parent.getClientesMatriculados(idTurma);
	            	scope.$parent.$parent.getClientesNaoMatriculados(idTurma);

	            })
            });
        }
    };
})

//