<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-init="initModalidades()" ng-controller="modalidade">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<table id="tableModalidades" class="mdl-data-table mdl-js-data-table <?php if($this->permissoes->modalidade_de_treino->excluir){ echo 'mdl-data-table--selectable'; } ?> mdl-shadow--2dp mtop30 " ng-cloak>
				<thead>
					<tr>
						<th>#</th>
						<th>Nome</th>
					</tr>
				</thead>
				<tbody>	
					<tr ng-repeat="modalidade in modalidades">						
						<td>
							{{modalidade.idModalidade}}
						</td>
						<td updatemodalidade="{{modalidade}}" ng-model="modalidade.nomeModalidade" contenteditable>
							{{modalidade.nomeModalidade}}
						</td>
					</tr>
				</tbody>
				<?php if($this->permissoes->modalidade_de_treino->adicionar or $this->permissoes->modalidade_de_treino->excluir): ?>
				<tfoot>
					<tr>
						<td colspan="5">	
							<?php if($this->permissoes->modalidade_de_treino->adicionar): ?>
							<div class="form-options">
								<button ng-click="addRow()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--green mdl-color-text--white">
									<i class="material-icons">add</i>
								</button>
							</div>	
							<?php endif; ?>

							<?php if($this->permissoes->modalidade_de_treino->excluir): ?>
							<div class="form-options">									
								<button ng-click="excluirModalidade()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--red mdl-color-text--white">
									<i class="material-icons">delete</i>
								</button>
							</div>
							<?php endif; ?>
						</td>
					</tr>
				</tfoot>
				<?php endif; ?>
			</table>


		</main>
	</div>

	<?php $this->load->view('common/_footer'); ?>

	<script type="text/javascript">
		// componentHandler.registerUpgradedCallback('MaterialDataTable', function(){
			// console.log('aoosiausoid');
		// });
	</script>
</body>