angular.module('adman', ['ui.mask', 'Alertify'])
.controller('configuracoes', function($scope, $http, $window, Alertify) {
	$scope.getAdms = function(){
		$http({
			method: 'POST',
			url: '/adman/configuracoes/getAdms',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){
			$scope.adms = data;
		});
	};

	$scope.getConfigNotificacoes = function(){
		$http({
			method: 'POST',
			url: '/adman/configuracoes/getConfigNotificacoes',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){
			$scope.notificacaoEquipamentos = data.notificacaoEquipamentos;
			$scope.notificacaoAulas = data.notificacaoAulas;
			$scope.notificacaoTurmas = data.notificacaoTurmas;
			$scope.notificacaoEmail = data.notificacaoEmail;

			componentHandler.upgradeDom('MaterialSwitch');
		});
	};

	$scope.removerPermissao = function(usuario){
		Alertify.confirm("Deseja remover a permissã de administrador de " + usuario.nome + "?")
		.then(function () {
			$http({
				method: 'POST',
				url: '/adman/configuracoes/removerPermissao',
				data: usuario.idUsuario,
				headers: {
					"Content-Type" :  "application/json"
				},
			}).success(function(data){
				Alertify.success('Permissão do usuário "' + usuario.nome + '" removida com sucesso');
				$scope.getAdms();
			});
		});
	};

	$scope.updateNotificacao = function(field){
		$http({
			method: 'POST',
			url: '/adman/configuracoes/updateNotificacao',
			data: {field: field},
			headers: {
				"Content-Type" :  "application/json"
			},
		})
	};

	$scope.triggering = false;

	$scope.updatePermissao = function(entidade, acao, tipoUsuario){
		dataUpdatePermissao = {entidade, acao, tipoUsuario};

		target = $(event.target);

		if(target.attr('updatevisualizar')){
			fields = target.attr('updatevisualizar');
			fields = eval(fields);

			if(!event.target.checked){
				setTimeout(function(){
					for (var i = 0; i < fields.length; i++) {
						$scope.triggering = true;

						if($('#' + fields[i]).is(':checked')){
							$('#' + fields[i]).trigger('click');
						}

						$scope.triggering = false;
					};
				}, 0);
			}

			$http({
				method: 'POST',
				url: '/adman/configuracoes/updatePermissao',
				data: dataUpdatePermissao,
				headers: {
					"Content-Type" :  "application/json"
				},
			})
			
		}else if(!target.attr('updatevisualizar') && !target.attr('checkvisualizar')){
			$http({
				method: 'POST',
				url: '/adman/configuracoes/updatePermissao',
				data: dataUpdatePermissao,
				headers: {
					"Content-Type" :  "application/json"
				},
			})
		}else if(target.attr('checkvisualizar') && !$scope.triggering){	
			checkvisualizar = $('#' + target.attr('checkvisualizar'));

			if(checkvisualizar.is(':checked')){
				$http({
					method: 'POST',
					url: '/adman/configuracoes/updatePermissao',
					data: dataUpdatePermissao,
					headers: {
						"Content-Type" :  "application/json"
					},
				})
			}else{
				event.preventDefault();
			}
		}else if($scope.triggering){
			$http({
				method: 'POST',
				url: '/adman/configuracoes/updatePermissao',
				data: dataUpdatePermissao,
				headers: {
					"Content-Type" :  "application/json"
				},
			})
		}
	}
})