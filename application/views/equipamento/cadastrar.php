<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-init="initEquipamentos()" ng-controller="equipamento">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<table id="tableEquipamentos" class="mdl-data-table mdl-js-data-table <?php if($this->permissoes->equipamento->excluir){ echo 'mdl-data-table--selectable'; } ?> mdl-shadow--2dp mtop30 " ng-cloak>
				<thead>
					<tr>
						<th>#</th>
						<th>Nome</th>
						<th>Descrição</th>
						<th>Modalidade</th>
						<th>Ativo / Inativo</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>	
					<tr ng-repeat="equipamento in equipamento.equipamentos" idEquipamento="{{equipamento.idEquipamento}}">						
						<td>
							{{equipamento.idEquipamento}}
						</td>
						<td <?php if($this->permissoes->equipamento->editar): ?> updateequipamento="{{equipamento}}" ng-model="equipamento.nomeEquipamento" contenteditable <?php endif; ?>>
							{{equipamento.nomeEquipamento}}
						</td>
						<td <?php if($this->permissoes->equipamento->editar): ?> updateequipamento="{{equipamento}}" ng-model="equipamento.descricaoEquipamento" contenteditable <?php endif; ?>>
							{{equipamento.descricaoEquipamento}}
						</td>
						<td <?php if($this->permissoes->equipamento->editar): ?> updateequipamento="{{equipamento}}" ng-model="equipamento.nomeModalidade" <?php endif; ?>>
							<?php if($this->permissoes->equipamento->editar){ ?>
							<a ng-if="equipamento.nomeModalidade" id="modalidade{{equipamento.idEquipamento}}" href="#">
								{{equipamento.nomeModalidade}}
							</a>
							<a class="empty" ng-if="!equipamento.nomeModalidade" id="modalidade{{equipamento.idEquipamento}}" href="#">
								Selecionar modalidade
							</a>
							<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="modalidade{{equipamento.idEquipamento}}">
								<li class="mdl-menu__item" ng-repeat="modalidade in modalidades">
									<a href="javascript:;" class="normal-fw" ng-model="nomeModalidade" updatemodalidade="{{modalidade.idModalidade}}" idequipamento="{{equipamento.idEquipamento}}">{{modalidade.nomeModalidade}}</a>
								</li>
							</ul>
							<?php }else{ ?>
							{{equipamento.nomeModalidade}}
							<?php } ?>
						</td>
						<td>
							<?php if($this->permissoes->equipamento->editar){ ?>
							<div ng-if="equipamento.snAtivo == 'ATIVO'">
								<label class="<?php if($this->permissoes->equipamento->editar){ echo 'not-clickable'; } ?> mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switchAtivo{{equipamento.idEquipamento}}">
									<input ng-click='switchAtivo(equipamento.idEquipamento)' type="checkbox" id="switchAtivo{{equipamento.idEquipamento}}" class="mdl-switch__input" checked>
									<span class="mdl-switch__label"></span>
								</label>
							</div>
							<div ng-if="equipamento.snAtivo == 'INATIVO'">
								<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="switchAtivo{{equipamento.idEquipamento}}">
									<input ng-click='switchAtivo(equipamento.idEquipamento)' type="checkbox" id="switchAtivo{{equipamento.idEquipamento}}" class="mdl-switch__input">
									<span class="mdl-switch__label"></span>
								</label>
							</div>
							<?php }else{ ?>
							<div ng-if="equipamento.snAtivo == 'ATIVO'">
								Ativo
							</div>
							<div ng-if="equipamento.snAtivo == 'INATIVO'">
								Inativo
							</div>
							<?php } ?>
						</td>
						<td>
							<?php if($this->permissoes->equipamento->editar){ ?>
							<a class="empty" id="statusEquipamento{{equipamento.idEquipamento}}" href="#">
								<i ng-if="equipamento.statusEquipamento == 'OK'" class="material-icons" title="Ok">done</i>
								<i ng-if="equipamento.statusEquipamento == 'COM DEFEITO'" class="material-icons mdl-color-text--red" title="Com defeito">warning</i>
								<i ng-if="equipamento.statusEquipamento == 'EM CONSERTO'" class="material-icons mdl-color-text--red" title="Em conserto">build</i>
							</a>
							<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="statusEquipamento{{equipamento.idEquipamento}}">
								<li class="mdl-menu__item">
									<a href="javascript:;" class="normal-fw" ng-model="statusEquipamento" updatestatus="OK" idequipamento="{{equipamento.idEquipamento}}">
										OK										
									</a>
								</li>
								<li class="mdl-menu__item">
									<a href="javascript:;" class="normal-fw" ng-model="statusEquipamento" updatestatus="COM DEFEITO" idequipamento="{{equipamento.idEquipamento}}">
										Com defeito
									</a>
								</li>
								<li class="mdl-menu__item">
									<a href="javascript:;" class="normal-fw" ng-model="statusEquipamento" updatestatus="EM CONSERTO" idequipamento="{{equipamento.idEquipamento}}">
										Em conserto							
									</a>
								</li>
							</ul>
							<?php }else{ ?>
							<i ng-if="equipamento.statusEquipamento == 'OK'" class="material-icons" title="Ok">done</i>
							<i ng-if="equipamento.statusEquipamento == 'COM DEFEITO'" class="material-icons mdl-color-text--red" title="Com defeito">warning</i>
							<i ng-if="equipamento.statusEquipamento == 'EM CONSERTO'" class="material-icons mdl-color-text--red" title="Em conserto">build</i>
							<?php } ?>

						</td>
					</tr>
				</tbody>
				<?php if($this->permissoes->equipamento->adicionar or $this->permissoes->equipamento->excluir): ?>
				<tfoot>
					<tr>
						<td colspan="5">
							<?php if($this->permissoes->equipamento->adicionar): ?>	
							<div class="form-options">
								<button ng-click="addRow()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--green mdl-color-text--white">
									<i class="material-icons">add</i>
								</button>
							</div>
							<?php endif; ?>

							<?php if($this->permissoes->equipamento->excluir): ?>	
							<div class="form-options">								
								<button ng-click="excluirEquipamento()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--red mdl-color-text--white">
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
</body>