<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-init="initAulas()" ng-controller="aula">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<table id="tableAulas" class="mdl-data-table mdl-js-data-table <?php if($this->permissoes->aula->excluir){ echo 'mdl-data-table--selectable'; } ?> mdl-shadow--2dp mtop30 " ng-cloak>
				<thead>
					<tr>
						<th>#</th>
						<th>Nome</th>
						<th>Descrição</th>
						<th>Modalidade</th>
					</tr>
				</thead>
				<tbody>	
					<tr ng-repeat="aula in aulas">						
						<td>
							{{aula.idAula}}
						</td>
						<td ng-model="aula.nomeAula" <?php if($this->permissoes->aula->editar): ?> updateaula="{{aula}}" contenteditable <?php endif; ?>>
							{{aula.nomeAula}}
						</td>
						<td ng-model="aula.descricaoAula" <?php if($this->permissoes->aula->editar): ?> updateaula="{{aula}}" contenteditable <?php endif; ?>>
							{{aula.descricaoAula}}
						</td>
						<td>
							<?php if($this->permissoes->aula->editar){ ?>
							<a ng-if="aula.nomeModalidade" id="aula{{aula.idAula}}" href="#">
								{{aula.nomeModalidade}}
							</a>
							<a class="empty" ng-if="!aula.nomeModalidade" id="aula{{aula.idAula}}" href="#">
								Selecionar modalidade
							</a>
							<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="aula{{aula.idAula}}">
								<li class="mdl-menu__item" ng-repeat="modalidade in modalidades">
									<a href="javascript:;" class="normal-fw" ng-model="nomeModalidade" updatemodalidade="{{modalidade.idModalidade}}" idaula="{{aula.idAula}}">{{modalidade.nomeModalidade}}</a>
								</li>
							</ul>
							<?php }else{ ?>
							{{aula.nomeModalidade}}
							<?php } ?>
						</td>
					</tr>
				</tbody>
				<?php if($this->permissoes->aula->adicionar or $this->permissoes->aula->excluir): ?>
				<tfoot>
					<tr>
						<td colspan="5">	
							<?php if($this->permissoes->aula->adicionar and $this->permissoes->aula->editar): ?>
							<div class="form-options">
								<button ng-click="addRow()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--green mdl-color-text--white">
									<i class="material-icons">add</i>
								</button>
							</div>
							<?php endif; ?>

							<?php if($this->permissoes->aula->excluir): ?>
							<div class="form-options">								
								<button ng-click="excluirAulas()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--red mdl-color-text--white">
									<i class="material-icons">delete</i>
								</button>
							</div>
							<?php endif; ?>
						</td>
					</tr>
				</tfoot>
				<?php endif; ?>
			</table>
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--12-col">
					<div class="form-options">
					</div>
				</div>
			</div>

		</main>
	</div>

	<?php $this->load->view('common/_footer'); ?>

	<script type="text/javascript">
		// componentHandler.registerUpgradedCallback('MaterialDataTable', function(){
			// console.log('aoosiausoid');
		// });
	</script>
</body>