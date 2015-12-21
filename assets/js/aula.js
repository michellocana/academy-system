angular.module('adman', ['ui.mask', 'Alertify'])
.controller('aula', function($scope, $http, $window, Alertify) {
	$scope.initAulas = function(){
		$scope.listarAulas();
		$scope.listarModalidades();
	};

	$scope.addCheckboxListener = function(){
		MaterialDataTable.prototype.addEventListener = function(type, listener) {
			'use strict';

			var table = document.getElementById('tableAulas');
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

			var table = document.getElementById('tableAulas');

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
			for (var i = 0; i < $scope.aulas.length; i++) {
				currentId = $scope.aulas[i].idAula;
				currentId = parseInt(currentId);
				$scope.selected.push(currentId);
			};
	    }
	}

	$scope.updateSelected = function(event){
		// Getting current scope
		var scope = angular.element($(this)).scope();

		currentId = parseInt(scope.aula.idAula);

		// Updating array
		if (event.target.checked) {
			$scope.selected.push(currentId);
	    }else{
			index = $scope.selected.indexOf(currentId);
			$scope.selected.splice(index, 1);
	    }
	};

	$scope.listarAulas = function() {
		$scope.aula = new Object();

		$http({
			method: 'POST',
			url: '/adman/aula/listar',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){

			$scope.aulas = [];

			for (var i = 0; i < data.length; i++) {
                $scope.aulas[i] = data[i];
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
            url: '/adman/aula/addRow',
            headers: {
                "Content-Type" :  "application/json"
            },
        }).success(function(data){
            $scope.listarAulas();
        })

    };

    $scope.excluirAulas = function(){
    	if($scope.selected.length > 0){
    		if($scope.selected.length == 1){
    			index = $scope.selected[0];

    			for (var i = 0; i < $scope.aulas.length; i++) {
    				if($scope.aulas[i].idAula == index){
    					nomeAula = $scope.aulas[i].nomeAula;
    				}
    			};

    			message = 'Deseja excluir "' + nomeAula + '"?';
    			messageSuccess = 'Aula "' + nomeAula + '" excluída com successo.';

    		}else{
    			message = 'Deseja excluir ' + $scope.selected.length + ' aulas?';
    			messageSuccess = $scope.selected.length + ' aulas foram excluídas com successo.';
    		}

	    	Alertify.confirm(message)
			.then(function(){
		        $http({
		            method: 'POST',
		            url: '/adman/aula/excluir',
		            data: {'aulas': $scope.selected},
		            headers: {
		                'Content-Type': 'application/json'
		            }
		        }).success(function(data){
		        	$scope.selected = [];

		        	$scope.listarAulas();

		        	Alertify.success(messageSuccess);
		        });
			});
    	}else{
			Alertify.error('Selecione uma ou mais aulas para excluir');
    	}
    }

})
.directive('updateaula', function($parse, $http) {
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

                aula = $parse(attrs.updateaula)(scope);

                $http({
                    method: 'POST',
                    data: {
                        idAula: parseInt(aula.idAula),
                        nomeAula: aula.nomeAula,
                        descricaoAula: aula.descricaoAula,
                    },
                    url: '/adman/aula/editar',
                    headers: {
                        "Content-Type" :  "application/json"
                    },
                })

            });
        }
    };
})
.directive('updatemodalidade', function($parse, $http) {
    return {
        require: 'ngModel',
        link: function(scope, elm, attrs, ctrl) {
            elm.bind('click', function() {
                dataUpdateModalidade = {
                    idModalidade: attrs.updatemodalidade,
                    idAula: attrs.idaula,
                };

                $http({
                    method: 'POST',
                    data: dataUpdateModalidade,
                    url: '/adman/aula/updateModalidade',
                    headers: {
                        "Content-Type" :  "application/json"
                    },
                }).success(function(data){
                    // Setando o nome da nova modalidade, após ter dado update
                    scope.aula.nomeModalidade = data.nomeModalidade;

                    ctrl.$render = function() {
                        elm.html(ctrl.$viewValue);
                    };
                })
            });
        }
    };
})