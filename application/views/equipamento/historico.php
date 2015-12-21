<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-init="initLogEquipamentos()" ng-controller="equipamento">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<table id="tableEquipamentos" class="mdl-data-table mdl-shadow--2dp mtop30 " ng-cloak>
				<thead>
					<tr>
						<th>#</th>
						<th>Equipamento</th>
						<th>Descrição</th>
						<th>Informações adicionais</th>
						<th>Data</th>
					</tr>
				</thead>
				<tbody>	
					<tr ng-repeat="log in logs">						
						<td>{{log.idLogEquipamento}}</td>
						<td>{{log.nomeEquipamento}}</td>
						<td>{{log.mensagemLogEquipamento}}</td>
						<td>{{log.infoLogEquipamento}}</td>
						<td>{{log.dataLogEquipamento}}</td>
					</tr>
				</tbody>
			</table>
		</main>
	</div>

	<?php $this->load->view('common/_footer'); ?>

</body>