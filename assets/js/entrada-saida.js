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
		// $('#alertify').addClass('hide-ok');
		Alertify.confirm($('#templateRequestPassword').text(), 'hide-options');
		componentHandler.upgradeDom('MaterialTextfield');
	};

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