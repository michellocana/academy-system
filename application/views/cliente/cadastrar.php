<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-controller="cliente" >
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<form method="POST" ng-submit='cadastrarCliente()' ng-init="setIdUsuario(<?php echo $this->uri->segment(3) ?>)">
				<input type="hidden" ng-model="cliente.idUsuario" value="{{cliente.idUsuario}}">
				<div class="mdl-grid">
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="peso" pattern="-?[0-9]*(\.[0-9]+)?" ng-model="cliente.peso" maxlength="6" required />
							<label class="mdl-textfield__label" for="peso">Peso</label>
							<span class="mdl-textfield__error">Casas decimais separadas por ponto. Exemplo: 70.5</span>
						</div>
					</div>
						
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="altura" pattern="-?[0-9]*(\.[0-9]+)?" ng-model="cliente.altura" maxlength="6" required />
							<label class="mdl-textfield__label" for="altura">Altura</label>
							<span class="mdl-textfield__error">Casas decimais separadas por ponto. Exemplo: 1.70</span>
						</div>
					</div>
						
  					<div class="mdl-cell mdl-cell--4-col pdtop20 pdbot20">
						<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sexoMasculino">
							<input type="radio" id="sexoMasculino" class="mdl-radio__button" name="sexo" ng-model="cliente.sexo" value='M' checked>
							<span class="mdl-radio__label">Masculino</span>
						</label>
						<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sexoFeminino">
							<input type="radio" id="sexoFeminino" class="mdl-radio__button" name="sexo" ng-model="cliente.sexo" value='F'>
							<span class="mdl-radio__label">Feminino</span>
						</label>
					</div>

  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="endereco" ng-model="cliente.endereco" maxlength="255" required />
							<label class="mdl-textfield__label" for="endereco">Endereço</label>
						</div>
					</div>
						
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="numero" ng-model="cliente.numero" maxlength="255" required />
							<label class="mdl-textfield__label" for="numero">Número</label>
						</div>
					</div>
						
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="bairro" ng-model="cliente.bairro" maxlength="255" required />
							<label class="mdl-textfield__label" for="bairro">Bairro</label>
						</div>
					</div>
						
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="cidade" ng-model="cliente.cidade" maxlength="255" required />
							<label class="mdl-textfield__label" for="cidade">Cidade</label>
						</div>
  					</div>

  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="telefone" ng-model="cliente.telefone" maxlength="15" required ui-mask="(99)9999-9999?9" model-view-value="true" ui-mask-placeholder ui-mask-placeholder-char="_" />
							<label class="mdl-textfield__label" for="telefone">Telefone</label>
						</div>
  					</div>
  				</div>
  				<div class="mdl-grid">
  					<div class="mdl-cell mdl-cell--12-col">
	  					<div class="form-options">
		  					<button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--green mdl-color-text--white ">
		  						<i class="material-icons">done</i>
							</button>
	  					</div>
	  					<div class="form-options">
		  					<a href="<?php echo base_url('usuario') ?>" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
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