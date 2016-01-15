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

	$scope.updatePermissao = function(entidade, acao, tipoUsuario, $event){
		dataUpdatePermissao = {entidade, acao, tipoUsuario};

		target = $($event.target);

		if(target.attr('updatevisualizar')){
			fields = target.attr('updatevisualizar');
			fields = eval(fields);

			// $scope.updateMenu();

			if(!$event.target.checked){
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
			// $scope.updateMenu();
			
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
				$event.preventDefault();
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
	};

	$scope.admAdded = false;

	$scope.addAdm = function(){
		if(!$scope.admAdded){
			tableRow = document.createElement('tr');
			tableRow.id = 'trAddAdm';


			$scope.admAdded = true;

			$http({
				method: 'POST',
				url: '/adman/configuracoes/getNaoAdms',
				headers: {
					"Content-Type" :  "application/json"
				},
			}).success(function(data){
				for (var i = 0; i < 3; i++) {
					tableColumn = document.createElement('td');

					if(i == 0){
						templateMdlMenu = $('#templateMdlMenu').text();

						menuItems = '';
						templateMdlMenuItem = $('#templateMdlMenuItem').text();

						for (var j = 0; j < data.length; j++) {
							thisMenuItem = templateMdlMenuItem.replace('{{idUsuario}}', data[j].idUsuario);
							thisMenuItem = thisMenuItem.replace('{{nomeUsuario}}', data[j].nome);

							menuItems += thisMenuItem;
						}

						templateMdlMenu = templateMdlMenu.replace('{{mdlMenuItems}}', menuItems);

						tableColumn.innerHTML = templateMdlMenu;

						setTimeout(function(){
							componentHandler.upgradeAllRegistered();
						}, 0);
					}

					tableRow.appendChild(tableColumn);
				}

				$('#tableConfiguracoes tbody').append(tableRow);

				var autocompleteAdm = $('#autocompleteAdm');

				autocompleteAdm.on('focus', function(){
					$scope.clearInput();
				}).on('keyup', function(){
					$scope.updateAutocomplete();
				});

				$('.addAdm').click(function(){
					idUsuario = $(this).attr('idusuario');

					$http({
						method: 'POST',
						url: '/adman/configuracoes/addAdm',
						data: idUsuario,
						headers: {
							"Content-Type" :  "application/json"
						},
					}).success(function(data){
						$('#trAddAdm').remove();

						$scope.getAdms();
						
						$scope.admAdded = false;
					});
				});	

			});
		}else{
			Alertify.error('Você só pode adicionar um administrador por vez.');
		}
	};

	$scope.updateAutocomplete = function(){
		// Getting current scope
		var target = $($event.target);
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
				target.text('Nome do usuário').val('Nome do usuário');
			}
		});

	};

	$scope.updateMenu = function(){
		sideMenu = $('#sideMenu');

		sideMenu.append('<div class="layer"><div class="spinner-wrapper"><div class="mdl-spinner mdl-spinner--single-color mdl-js-spinner is-active"></div></div></div>');

		componentHandler.upgradeDom('MaterialSpinner')

		setTimeout(function(){
			layer = $('#sideMenu .layer');

			layer.addClass('fadein');

			$http({
				method: 'POST',
				url: '/adman/configuracoes/getMenu',
				headers: {
					"Content-Type" :  "application/json"
				},
			}).success(function(data){

				//grafico nao atualiza
				sideMenu.empty();
				sideMenu.append(data);
				setTimeout(function(){
					layer.removeClass('fadein');
				},100);
				
			});
		},100);
	}

})