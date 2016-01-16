angular.module('adman', ['ui.mask', 'Alertify'])
.controller('entrada-saida', function($scope, $http, $window, Alertify) {
	$scope.isFullscreen = (document.documentElement.clientWidth == screen.width && document.documentElement.clientHeight == screen.height);

	$scope.askFullscreen = function(){
		Alertify.confirm('Deseja deixar em tela cheia?')
		.then(function(response){
			$scope.fullscreenRequest();
		});
	};

	$scope.fullscreenRequest = function(){
		if ((document.fullScreenElement && document.fullScreenElement !== null) ||    
			(!document.mozFullScreen && !document.webkitIsFullScreen)) {
			if (document.documentElement.requestFullScreen) {  
				document.documentElement.requestFullScreen();  
			} else if (document.documentElement.mozRequestFullScreen) {  
				document.documentElement.mozRequestFullScreen();  
			} else if (document.documentElement.webkitRequestFullScreen) {  
				document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);  
			}  
		} 
	};

	$scope.fullscreenCancel = function(){
		if (document.cancelFullScreen) {  
			document.cancelFullScreen();  
		} else if (document.mozCancelFullScreen) {  
			document.mozCancelFullScreen();  
		} else if (document.webkitCancelFullScreen) {  
			document.webkitCancelFullScreen();  
		}  
	};

	$scope.home = function(){
		Alertify.confirm($('#templateRequestPassword').text(),'alertify-adm-pass');
		componentHandler.upgradeDom('MaterialTextfield');
		admPass = $('#admPass');
		okBtn = $('.alertify-adm-pass #alertify-ok');

		okBtn.on('click', function(event){
			if(admPass.val() == '')
				Alertify.error('Digite sua senha de administrador para voltar ao sistema.');
			else{
				$http({
					method: 'POST',
					url: '/adman/entrada-saida/checkPasswordMatch',
					headers: {
						"Content-Type" :  "application/json"
					},
					data: {pass: admPass.val()},
				}).success(function(data){
					if(data){
						$window.location.href = '/adman/';
					}else{
						Alertify.error("Senha de administrador incorreta.");
					}
				});

			}
		});
	};

	$scope.registrarEntradaSaida = function(){
		$http({
			method: 'POST',
			url: '/adman/entrada-saida/registrarEntradaSaida',
			headers: {
				"Content-Type" :  "application/json"
			},
			data: {
				user: $scope.dsNomeEntradaSaida,
				pass: $scope.dsPasswordEntradaSaida,
			},
		}).success(function(data){
			if(data){
				console.log(data);
				if(data.entradaSaida == 'ENTRADA'){
					Alertify.success('Entrada registrada - ' + data.hora);
				}else{
					Alertify.log('Saída registrada - ' + data.hora);
				}


			}else{
				Alertify.error("Nome de usuário, e-mail ou senha incorreta.");
			}
			
			$scope.dsPasswordEntradaSaida = '';
			$scope.dsNomeEntradaSaida = '';
		});
	}

}).directive('resize', function ($window) {
    return function (scope, element, attr) {

        var w = angular.element($window);
        scope.$watch(function () {
            return {
                'h': w.height(), 
                'w': w.width()
            };
        }, function (newValue, oldValue) {
            scope.windowHeight = newValue.h;
            scope.windowWidth = newValue.w;

			scope.isFullscreen = (scope.windowWidth == screen.width && scope.windowHeight == screen.height);

        }, true);

        w.bind('resize', function () {
            scope.$apply();


        });
    }
}); 