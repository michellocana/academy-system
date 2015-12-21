<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-controller="turma">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<form method="POST" ng-submit='<?php if($this->uri->segment(2) == 'cadastro'){ echo "cadastrarTurma()"; }else{ echo "alterarTurma()"; } ?>' ng-cloak ng-init="initTurmas(<?php echo $this->uri->segment(3) ?>)">
				<div class="mdl-grid">
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<a ng-model="turma.idAula" href="" id="selectAula">
								<span ng-if="turma.idAula">{{turma.nomeAula}}</span>
								<span ng-if="!turma.idAula">Selecionar aula</span>
							</a>
							<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="selectAula">
								<li class="mdl-menu__item" ng-repeat="aula in aulas">
									<a href="javascript:;" class="normal-fw" ng-model="aula.nomeAula" setaula="{{aula.idAula}}" idturma="{{turma.idTurma}}">{{aula.nomeAula}}</a>
								</li>
							</ul>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<a ng-model="turma.idInstrutor" href="" id="selectInstrutor">
								<span ng-if="turma.idInstrutor">{{turma.nomeInstrutor}}</span>
								<span ng-if="!turma.idInstrutor">Selecionar instrutor</span>
							</a>
							<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="selectInstrutor">
								<li class="mdl-menu__item" ng-repeat="instrutor in instrutores">
									<a href="javascript:;" class="normal-fw" ng-model="aula.nomeInstrutor" setinstrutor="{{instrutor.idUsuario}}" idturma="{{turma.idTurma}}">{{instrutor.nomeInstrutor}}</a>
								</li>
							</ul>

						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<a ng-model="turma.statusTurma" id="selectStatus" href="">
								<span ng-if="turma.statusTurma">{{statusTurmaTexto}}</span>
								<span ng-if="!turma.statusTurma">Selecionar status</span>
							</a>
							<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="selectStatus">
								<li class="mdl-menu__item">
									<a href="javascript:;" ng-model="statusTurma" setstatus="INSCRICOES ABERTAS">
										Inscrições abertas
									</a>
								</li>
								<li class="mdl-menu__item">
									<a href="javascript:;" ng-model="statusTurma" setstatus="INSCRICOES ENCERRADAS">
										Inscrições encerradas
									</a>
								</li>
								<li class="mdl-menu__item">
									<a href="javascript:;" ng-model="statusTurma" setstatus="EM ANDAMENTO">
										Em andamento
									</a>
								</li>
							</ul>

						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="sigla" ng-model="turma.sigla" maxlength="255" required />
							<label class="mdl-textfield__label" for="sigla">Sigla</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="capacidade" pattern="[0-9]*" ng-model="turma.capacidade" maxlength="11" required />
							<label class="mdl-textfield__label" for="capacidade">Capacidade</label>
							<span class="mdl-textfield__error">Somente números nesse campo.</span>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="horario" ng-model="turma.horario" maxlength="8" required  ui-mask="99:99" ui-mask-placeholder ui-mask-placeholder-char="_"/>
							<label class="mdl-textfield__label" for="horario">Horário</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
  						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
  							<input class="mdl-textfield__input" type="text" id="mensalidade" pattern="-?[0-9]*(\.[0-9]{2})?" ng-model="turma.mensalidade" maxlength="11" required />
  							<label class="mdl-textfield__label" for="mensalidade">Mensalidade</label>
  							<span class="mdl-textfield__error">Casas decimais separadas por ponto. Exemplo: 130.00</span>
  						</div>
  					</div>
  				</div>
  				<?php 
  					if($this->uri->segment(2) == 'editar')
  						$this->load->view('turma/editar')
  				 ?>
  				<div class="mdl-grid">
  					<div class="mdl-cell mdl-cell--12-col">
	  					<div class="form-options">
		  					<button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--green mdl-color-text--white ">
		  						<i class="material-icons">done</i>
							</button>
	  					</div>
	  					<div class="form-options">
		  					<a href="<?php echo base_url('turma') ?>" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
		  						<i class="material-icons">clear</i>
							</a>
	  					</div>
  					</div>
  				</div>
			</form>
		</main>
	</div>

	<?php $this->load->view('common/_footer'); ?>
</body>