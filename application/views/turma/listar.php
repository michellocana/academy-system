<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-init="listarTurmas()" ng-controller="turma">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<table class="mdl-data-table mdl-shadow--2dp mtop30" ng-cloak>
				<thead>
					<tr>
						<th>#</th>
						<th>Sigla</th>
						<th>Aula</th>
						<th>Capacidade</th>
						<th>Status</th>
						<?php if($this->permissoes->turma->editar or $this->permissoes->turma->excluir): ?>
						<th>Opções</th>
						<?php endif; ?>
					</tr>
				</thead>
				<tbody>	
					<tr ng-repeat="turma in turmas">						
						<td>
							{{turma.idTurma}}
						</td>
						<td>
							{{turma.sigla}}
						</td>
						<td>
							{{turma.nomeAula}}
						</td>
						<td>
							{{turma.capacidade}}
						</td>
						<td>
							<?php if($this->permissoes->turma->editar){ ?>
							<a href="" id="statusTurma{{turma.idTurma}}">
								<span ng-if="turma.statusTurma == 'INSCRICOES ABERTAS'">Incrições abertas</span>
								<span ng-if="turma.statusTurma == 'INSCRICOES ENCERRADAS'">Inscrições encerradas</span>
								<span ng-if="turma.statusTurma == 'EM ANDAMENTO'">Em andamento</span>
							</a>
							<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="statusTurma{{turma.idTurma}}">
								<li class="mdl-menu__item">
									<a href="javascript:;" ng-model="statusTurma" updatestatus="INSCRICOES ABERTAS" idturma="{{turma.idTurma}}">
										Inscrições abertas
									</a>
								</li>
								<li class="mdl-menu__item">
									<a href="javascript:;" ng-model="statusTurma" updatestatus="INSCRICOES ENCERRADAS" idturma="{{turma.idTurma}}">
										Inscrições encerradas
									</a>
								</li>
								<li class="mdl-menu__item">
									<a href="javascript:;" ng-model="statusTurma" updatestatus="EM ANDAMENTO" idturma="{{turma.idTurma}}">
										Em andamento
									</a>
								</li>
							</ul>
							<?php }else{ ?>
								{{turma.statusTurma}}
							<?php } ?>

						</td>
						<?php if($this->permissoes->turma->editar or $this->permissoes->turma->excluir): ?>
						<td>
							<?php if ($this->permissoes->turma->editar): ?>								
							<a href="<?php echo base_url('turma/editar') . '/'; ?>{{turma.idTurma}}" class="mdl-button small mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
								Editar
							</a>
							<?php endif ?>

							<?php if ($this->permissoes->turma->excluir): ?>								
							<a ng-model="excluirTurma" excluirturma="{{turma.idTurma}}" sigla="{{turma.sigla}}" class="mdl-button small mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
								Excluir
							</a>
							<?php endif ?>
						</td>
						<?php endif; ?>
					</tr>
				</tbody>
			</table>
		</main>
	</div>

	<?php $this->load->view('common/_footer'); ?>
</body>