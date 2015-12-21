angular.module('adman', ['ui.mask', 'Alertify'])
.controller('modalidade', function($scope, $http, $window, Alertify) {
	$scope.initModalidades = function(){
		$scope.listarModalidades();
	};

	$scope.addCheckboxListener = function(){
		MaterialDataTable.prototype.addEventListener = function(type, listener) {
			'use strict';

			var table = document.getElementById('tableModalidades');
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

			var table = document.getElementById('tableModalidades');

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
			for (var i = 0; i < $scope.modalidades.length; i++) {
				currentId = $scope.modalidades[i].idModalidade;
				currentId = parseInt(currentId);
				$scope.selected.push(currentId);
			};
	    }
	}

	$scope.updateSelected = function(event){
		// Getting current scope
		var scope = angular.element($(this)).scope();

		currentId = parseInt(scope.modalidade.idModalidade);

		// Updating array
		if (event.target.checked) {
			$scope.selected.push(currentId);
	    }else{
			index = $scope.selected.indexOf(currentId);
			$scope.selected.splice(index, 1);
	    }
	};

	$scope.listarModalidades = function() {
		$scope.modalidade = new Object();

		$http({
			method: 'POST',
			url: '/adman/modalidade/listar',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){

			$scope.modalidades = [];

			for (var i = 0; i < data.length; i++) {
                $scope.modalidades[i] = data[i];
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

    $scope.addRow = function(){
        $http({
            method: 'POST',
            url: '/adman/modalidade/addRow',
            headers: {
                "Content-Type" :  "application/json"
            },
        }).success(function(data){
            /*
                Atualizando a lista de equipamentos por que fez insert quando adicionou row
            */

            $scope.listarModalidades();

        })

    };

    $scope.excluirModalidade = function(){
    	if($scope.selected.length > 0){
    		if($scope.selected.length == 1){
    			index = $scope.selected[0];

    			for (var i = 0; i < $scope.modalidades.length; i++) {
    				if($scope.modalidades[i].idModalidade == index){
    					nomeModalidade = $scope.modalidades[i].nomeModalidade;
    				}
    			};

    			message = 'Deseja excluir "' + nomeModalidade + '"?';
    			messageSuccess = 'Modalidade "' + nomeModalidade + '" excluída com successo.';

    		}else{
    			message = 'Deseja excluir ' + $scope.selected.length + ' modalidades?';
    			messageSuccess = $scope.selected.length + ' modalidades foram excluídas com successo.';
    		}

	    	Alertify.confirm(message)
			.then(function(){
		        $http({
		            method: 'POST',
		            url: '/adman/modalidade/excluir',
		            data: {'modalidades': $scope.selected},
		            headers: {
		                'Content-Type': 'application/json'
		            }
		        }).success(function(data){
		        	$scope.selected = [];

		        	$scope.listarModalidades();

		        	Alertify.success(messageSuccess);
		        });
			});
    	}else{
			Alertify.error('Selecione uma ou mais modalidades para excluir');
    	}
    }

})
.directive('updatemodalidade', function($parse, $http) {
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

                modalidade = $parse(attrs.updatemodalidade)(scope);

                $http({
                    method: 'POST',
                    data: {
                        idModalidade: parseInt(modalidade.idModalidade),
                        nomeModalidade: modalidade.nomeModalidade,
                    },
                    url: '/adman/modalidade/editar',
                    headers: {
                        "Content-Type" :  "application/json"
                    },
                })

            });
        }
    };
})