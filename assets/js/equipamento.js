angular.module('adman', ['ui.mask', 'Alertify'])
.controller('equipamento', function($scope, $http, $window, Alertify) {
	$scope.initEquipamentos = function(){
		$scope.listarEquipamentos();
		$scope.listarModalidades();
	};

    $scope.initLogEquipamentos = function(){
        $http({
            method: 'POST',
            url: '/adman/equipamento/listarLogs',
            headers: {
                "Content-Type" :  "application/json"
            },
        }).success(function(data){
            $scope.logs = data;
        });

    };

	$scope.addCheckboxListener = function(){
		MaterialDataTable.prototype.addEventListener = function(type, listener) {
			'use strict';

			var table = document.getElementById('tableEquipamentos');
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

			var table = document.getElementById('tableEquipamentos');

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
			for (var i = 0; i < $scope.equipamento.equipamentos.length; i++) {
				currentId = $scope.equipamento.equipamentos[i].idEquipamento;
				currentId = parseInt(currentId);
				$scope.selected.push(currentId);
			};
	    }

	}


	$scope.updateSelected = function(event){
		// Getting current scope
		var scope = angular.element($(this)).scope();

		currentId = parseInt(scope.equipamento.idEquipamento);

		// Updating array
		if (event.target.checked) {
			$scope.selected.push(currentId);
	    }else{
			index = $scope.selected.indexOf(currentId);
			$scope.selected.splice(index, 1);
	    }
	};


	$scope.listarEquipamentos = function() {
		$scope.equipamento = new Object();

		$http({
			method: 'POST',
			url: '/adman/equipamento/listar',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){

			$scope.equipamento.equipamentos = [];

			for (var i = 0; i < data.length; i++) {
                $scope.equipamento.equipamentos[i] = data[i];
            };

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

		}).error(function(data){
			Alertify.error(data.message);
		});
	};

	$scope.listarModalidades = function(){
		$scope.modalidades = [];

		$http({
			method: 'POST',
			url: '/adman/equipamento/listarModalidades',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){

			for (var i = 0; i < data.length; i++) {
				$scope.modalidades[i] = data[i];
			};
		});
	};

    $scope.addRow = function(){
        $http({
            method: 'POST',
            url: '/adman/equipamento/addRow',
            headers: {
                "Content-Type" :  "application/json"
            },
        }).success(function(data){
            /*
                Atualizando a lista de equipamentos por que fez insert quando adicionou row
            */

            $scope.listarEquipamentos();

        })

    };

    $scope.switchAtivo = function(idEquipamento){
        $http({
            method: 'POST',
            url: '/adman/equipamento/switchAtivo',
            data: {'idEquipamento': idEquipamento},
            headers: {
                'Content-Type': 'application/json'
            }
        }).success(function(data){
            dataLogEquipamento = {
                infoLogEquipamento: 'Sem informações adicionais',
                mensagemLogEquipamento: data.mensagemLogEquipamento,
                idEquipamento: idEquipamento,
            };

            $http({
                method: 'POST',
                data: dataLogEquipamento,
                url: '/adman/equipamento/log',
                headers: {
                    "Content-Type" :  "application/json"
                },
            })
        });

    };

    $scope.excluirEquipamento = function(){
    	if($scope.selected.length > 0){
    		/*
    			Se o usuário estiver buscando somente 1 equipamento para excluir,
    			vai buscar o nome desse equipamento para aparecer no alert de confirmação.
    			Se estiver selecionando múltiplos equipamentos, vai mostrar a quantidade de 
    			equipamentos que está prestes a excluir
    		*/
    		if($scope.selected.length == 1){
    			index = $scope.selected[0];

    			for (var i = 0; i < $scope.equipamento.equipamentos.length; i++) {
    				if($scope.equipamento.equipamentos[i].idEquipamento == index){
    					nomeUsuario = $scope.equipamento.equipamentos[i].nomeEquipamento;
    				}
    			};

    			message = 'Deseja excluir "' + nomeUsuario + '"?';
    			messageSuccess = 'Equipamento "' + nomeUsuario + '" excluído com successo.';

    		}else{
    			message = 'Deseja excluir ' + $scope.selected.length + ' usuários?';
    			messageSuccess = $scope.selected.length + ' equipamentos foram excluídos com successo.';
    		}

	    	Alertify.confirm(message)
			.then(function(){
		        $http({
		            method: 'POST',
		            url: '/adman/equipamento/excluir',
		            data: {'equipamentos': $scope.selected},
		            headers: {
		                'Content-Type': 'application/json'
		            }
		        }).success(function(data){
		        	$scope.selected = [];

		        	$scope.listarEquipamentos();

		        	Alertify.success(messageSuccess);
		        });
			});
    	}else{
			Alertify.error('Selecione um ou mais equipamentos para excluir');
    	}
    }

}).directive('updateequipamento', function($parse, $http) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('blur', function() {
                scope.$apply(function() {
                    ctrl.$setViewValue(elm.text());
                });

                ctrl.$render = function() {
                    elm.html(ctrl.$viewValue);
                };

                equipamento = $parse(attrs.updateequipamento)(scope);

                /* 
                    Removendo descrição da modalidade antes de fazer update, pois esse campo é só para visualização,
                    o que pode mesmo mudar é o id da modalidade
                */
                delete equipamento.nomeModalidade;

                $http({
                    method: 'POST',
                    data: equipamento,
                    url: '/adman/equipamento/editar',
                    headers: {
                        "Content-Type" :  "application/json"
                    },
                })

            });
        }
    };
}).directive('updatemodalidade', function($parse, $http) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('click', function() {
                dataUpdateModalidade = {
                    idModalidade: attrs.updatemodalidade,
                    idEquipamento: attrs.idequipamento,
                };

                $http({
                    method: 'POST',
                    data: dataUpdateModalidade,
                    url: '/adman/equipamento/updateModalidade',
                    headers: {
                        "Content-Type" :  "application/json"
                    },
                }).success(function(data){
                    // Setando o nome da nova modalidade, após ter dado update
                    scope.equipamento.nomeModalidade = data.nomeModalidade;

                    ctrl.$render = function() {
                        elm.html(ctrl.$viewValue);
                    };
                })
            });
        }
    };
}).directive('updatestatus', function($parse, $http, Alertify) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('click', function() {
                oldValueStatusEquipamento = scope.equipamento.statusEquipamento;
                
                dataUpdateStatus = {
                    idEquipamento: attrs.idequipamento,
                    statusEquipamento: attrs.updatestatus,
                };

                if(scope.equipamento.statusEquipamento != dataUpdateStatus.statusEquipamento){
                    $http({
                        method: 'POST',
                        data: dataUpdateStatus,
                        url: '/adman/equipamento/updateStatus',
                        headers: {
                            "Content-Type" :  "application/json"
                        },
                    }).success(function(data){
                        scope.equipamento.statusEquipamento = dataUpdateStatus.statusEquipamento;

                        ctrl.$render = function() {
                            elm.html(ctrl.$viewValue);
                        };

                        Alertify.success("Status do equipamento " + data.nomeEquipamento + " atualizado para: " + dataUpdateStatus.statusEquipamento);

                        Alertify.prompt('Informações adicionais para a manutenção do equipamento ' + data.nomeEquipamento + '').then(
                            function onOk(resposta) {
                                dataLogEquipamento = {
                                    infoLogEquipamento: (resposta == '') ? 'Sem informações adicionais' : resposta,
                                    mensagemLogEquipamento: 'Status do equipamento alterado de ' + oldValueStatusEquipamento + ' para ' + dataUpdateStatus.statusEquipamento,
                                    idEquipamento: dataUpdateStatus.idEquipamento,
                                };

                                $http({
                                    method: 'POST',
                                    data: dataLogEquipamento,
                                    url: '/adman/equipamento/log',
                                    headers: {
                                        "Content-Type" :  "application/json"
                                    },
                                })
                            }
                        );

                    })
                }

            });
        }
    };
})