angular.module('adman', ['ui.mask', 'Alertify'])
.controller('home', function($scope, $http, $window, Alertify) {

	$scope.initGraficos = function(){
		$(function(){
			$scope.graphHorarioDePico();
			$scope.graphFrequenciaAlunos();
			$scope.graphMasculinoFeminino();
			$scope.graphModalidadesMatriculas();
			$scope.graphFaixaEtaria();
			$scope.graphPesoMedio();
		});
	};

	$scope.graphHorarioDePico = function(){
		$http({
			method: 'POST',
			url: '/adman/home/getHorariosDePico',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){
			$('#graphHorarioDePico').highcharts({
				chart: {
					type: 'areaspline',
					backgroundColor: '#f5f5f5',
					style: {
						fontFamily: "'Roboto', 'Helvetica', sans-serif",
					},
				},
				title: {
					text: 'Horários de pico',
					style: {
						fontWeight: "500",
						color:      "rgb(117, 117, 117)",
						fontSize:   "20px"
					},
				},
				legend: {
					layout: 'horizontal',
					align: 'right',
					verticalAlign: 'top',
					x: -10,
					y: 50,
					floating: true,
					borderWidth: 1,
					backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
				},
				xAxis: {
					categories: [
					'08:00 - 10:00',
					'10:00 - 12:00',
					'12:00 - 14:00',
					'14:00 - 16:00',
					'16:00 - 18:00',
					'18:00 - 20:00',
					'20:00 - 22:00'
					],
				},
				yAxis: {
					title: {
						text: 'Clientes frequentando a academia'
					},
				},
				tooltip: {
					shared: true,
					valueSuffix: ' visitantes',
				},
				credits: {
					enabled: false
				},
				plotOptions: {
					areaspline: {
						fillOpacity: 0.5
					}
				},
				series: [
				{
					name: 'Janeiro',
					data: [data.month10810, data.month11012, data.month11214, data.month11416, data.month11618, data.month11820, data.month12022]
				},
				{
					name: 'Fevereiro',
					data: [data.month20810, data.month21012, data.month21214, data.month21416, data.month21618, data.month21820, data.month22022]
				},
				{
					name: 'Março',
					data: [data.month30810, data.month31012, data.month31214, data.month31416, data.month31618, data.month31820, data.month32022]
				},
				]
			});
		});

	};

	$scope.graphFrequenciaAlunos = function(){
		$http({
			method: 'POST',
			url: '/adman/home/getFrequenciaAlunos',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){
			$('#graphFrequenciaAlunos').highcharts({
				chart: {
					type: 'areaspline',
					backgroundColor: '#f5f5f5',
					style: {
						fontFamily: "'Roboto', 'Helvetica', sans-serif",
					},
				},
				title: {
					text: 'Frequência dos alunos',
					style: {
						fontWeight: "500",
						color:      "rgb(117, 117, 117)",
						fontSize:   "20px"
					},
				},
				legend: {
					layout: 'horizontal',
					align: 'right',
					verticalAlign: 'top',
					x: -10,
					y: 50,
					floating: true,
					borderWidth: 1,
					backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
				},
				xAxis: {
					categories: [
					'Agosto',
					'Setembro',
					'Outubro',
					'Novembro',
					'Dezembro',
					'Janeiro',
					],
				},
				yAxis: {
					title: {
						text: 'Frequência dos alunos nos últimos 6 meses'
					},
				},
				tooltip: {
					shared: true,
					valueSuffix: ' alunos',
				},
				credits: {
					enabled: false
				},
				plotOptions: {
					areaspline: {
						fillOpacity: 0.5
					}
				},
				series: [
				{
					name: 'Número de alunos',
					data: [data[5], data[4], data[3], data[2], data[1], data[0]]
				},
				]
			});
		});

	};

	$scope.graphMasculinoFeminino = function(){
		$http({
			method: 'POST',
			url: '/adman/home/getMasculinoFeminino',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data2){
			countM = parseInt(data2);
			countF = parseInt(100 - data2);

			$('#graphMasculinoFeminino').highcharts({
				chart: {
					plotBackgroundColor: null,
					plotBorderWidth: null,
					plotShadow: false,
					type: 'pie',
					backgroundColor: '#f5f5f5'
				},
				title: {
					text: 'Porcentagem de clientes de acordo com o sexo'
				},
				tooltip: {
					pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				},
				plotOptions: {
					pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						dataLabels: {
							enabled: false
						},
						showInLegend: true
					}
				},
				credits: {
					enabled: false,
				},
				series: [{
					name: "Sexo",
					colorByPoint: true,
					data: [{
						name: "Masculino",
						y: countM,
					}, {
						name: "Feminino",
						y: countF,
					}]
				}]
			});
		});
	}

	$scope.graphModalidadesMatriculas = function(){
		$http({
			method: 'POST',
			url: '/adman/home/getPorcentagemModalidades',
			headers: {
				"Content-Type" :  "application/json"
			},
		}).success(function(data){
			console.log(data);

			/*percentageModalidades = {
						name: "Musculação",
						y: 43.00
					}, {
						name: "Luta",
						y: 30.00,
					},{
						name: "Ginástica",
						y: 27.00,
					};*/
			percentageModalidades = data;


			for (var i = data.length - 1; i >= 0; i--) {
				percentageModalidades[i].name = data[i].nomeModalidade;
				percentageModalidades[i].y = data[i].percentage;
			};


			$('#graphModalidadesMatriculas').highcharts({
				chart: {
					plotBackgroundColor: null,
					plotBorderWidth: null,
					plotShadow: false,
					type: 'pie',
					backgroundColor: '#f5f5f5'
				},
				title: {
					text: 'Porcentagem de modalidades mais matriculadas'
				},
				tooltip: {
					pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				},
				plotOptions: {
					pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						dataLabels: {
							enabled: false
						},
						showInLegend: true
					}
				},
				credits: {
					enabled: false,
				},
				series: [{
					name: "Modalidade",
					colorByPoint: true,
					data: [percentageModalidades]
				}]
			});
		});
	}

	$scope.graphFaixaEtaria = function(){
		$('#graphFaixaEtaria').highcharts({
			chart: {
				type: 'bar'
			},
			title: {
				text: 'Faixa etária dos clientes'
			},
			xAxis: {
				categories: ['18-25', '26-30', '31-50', '50-70', '70+'],
				title: {
					text: null
				}
			},
			yAxis: {
				min: 0,
				title: {
					text: 'Quantidade de clientes separados por faixa etária',
					align: 'high'
				},
				labels: {
					overflow: 'justify'
				}
			},
			tooltip: {
				valueSuffix: ' millions'
			},
			plotOptions: {
				bar: {
					dataLabels: {
						enabled: true
					}
				}
			},
			legend: {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'top',
				x: -40,
				y: 55,
				floating: true,
				borderWidth: 1,
				backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
				shadow: true
			},
			credits: {
				enabled: false
			},
			series: [{
				name: 'Faixa Etária',
				data: [240, 305, 236, 20, 10]
			}]
		});
	};

	$scope.graphPesoMedio = function(){
		$('#graphPesoMedio').highcharts({
			chart: {
				type: 'bar'
			},
			title: {
				text: 'Peso médio dos clientes'
			},
			xAxis: {
				categories: ['40-55', '56-65', '66-75', '76-85', '85+'],
				title: {
					text: null
				}
			},
			yAxis: {
				min: 0,
				title: {
					text: 'Peso em quilos',
					align: 'high',
				},
				labels: {
					overflow: 'justify'
				}
			},
			tooltip: {
				valueSuffix: ' millions'
			},
			plotOptions: {
				bar: {
					dataLabels: {
						enabled: true
					}
				}
			},
			legend: {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'top',
				x: 0,
				y: 55,
				floating: true,
				borderWidth: 1,
				backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
				shadow: true
			},
			credits: {
				enabled: false
			},
			series: [{
				name: 'Número de clientes',
				data: [240, 305, 236, 20, 10],
			}]
		});
	};

})
