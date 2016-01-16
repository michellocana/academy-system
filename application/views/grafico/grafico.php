<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-controller="home">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100 pdtop50 pdbot50' ng-init="initGraficos()">
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--12-col">
					<div id="graphHorarioDePico" class="graph"></div>
				</div>

				<div class="mdl-cell mdl-cell--12-col">
					<div id="graphFrequenciaAlunos" class="graph"></div>
				</div>

				<div class="mdl-cell mdl-cell--6-col">
					<div id="graphMasculinoFeminino" class="graph"></div>
				</div>

				<div class="mdl-cell mdl-cell--6-col">
					<div id="graphModalidadesMatriculas" class="graph"></div>
				</div>

				<div class="mdl-cell mdl-cell--12-col">
					<div id="graphFaixaEtaria" class="graph"></div>
				</div>

				<div class="mdl-cell mdl-cell--12-col">
					<div id="graphPesoMedio" class="graph"></div>
				</div>


				
			</div>
		</main>
	</div>

	<?php $this->load->view('common/_footer'); ?>
	<?php /*
	<script type="text/javascript">
		$(function () {
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
         				color: 		"rgb(117, 117, 117)",
         				fontSize: 	"20px"
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
						data: [3, 10, 19, 10, 5, 9, 11]
					},
					{
						name: 'Fevereiro',
						data: [10, 8, 12, 16, 1, 15, 7]
					},
					{
						name: 'Março',
						data: [8, 17, 14, 7, 13, 5, 15]
					},
				]
			});
		});
	</script>
	*/ ?>
</body>