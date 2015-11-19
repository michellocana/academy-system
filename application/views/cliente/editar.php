<div class="mdl-grid">
	<div class="mdl-cell mdl-cell--4-col">
		<h5 class="mtop0 mbot0">Informações específicas de cliente</h5>
	</div>
</div>

<div class="mdl-grid">
	<div class="mdl-cell mdl-cell--4-col">
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			<input class="mdl-textfield__input" type="text" id="peso" pattern="-?[0-9]*(\.[0-9]+)?" ng-model="usuario.peso" maxlength="6" required />
			<label class="mdl-textfield__label" for="peso">Peso</label>
			<span class="mdl-textfield__error">Casas decimais separadas por ponto. Exemplo: 70.5</span>
		</div>
	</div>

	<div class="mdl-cell mdl-cell--4-col">
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			<input class="mdl-textfield__input" type="text" id="altura" pattern="-?[0-9]*(\.[0-9]+)?" ng-model="usuario.altura" maxlength="6" required />
			<label class="mdl-textfield__label" for="altura">Altura</label>
			<span class="mdl-textfield__error">Casas decimais separadas por ponto. Exemplo: 1.70</span>
		</div>
	</div>

	<div class="mdl-cell mdl-cell--4-col">
		<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sexoMasculino">
			<input type="radio" id="sexoMasculino" class="mdl-radio__button" name="sexo" ng-model="usuario.sexo" value='"M"'>
			<span class="mdl-radio__label">Masculino</span>
		</label>
		<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sexoFeminino">
			<input type="radio" id="sexoFeminino" class="mdl-radio__button" name="sexo" ng-model="usuario.sexo" value='"F"'>
			<span class="mdl-radio__label">Feminino</span>
		</label>
	</div>

	<div class="mdl-cell mdl-cell--4-col">
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			<input class="mdl-textfield__input" type="text" id="endereco" ng-model="usuario.endereco" maxlength="255" required />
			<label class="mdl-textfield__label" for="endereco">Endereço</label>
		</div>
	</div>

	<div class="mdl-cell mdl-cell--4-col">
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			<input class="mdl-textfield__input" type="text" id="numero" ng-model="usuario.numero" maxlength="255" required />
			<label class="mdl-textfield__label" for="numero">Número</label>
		</div>
	</div>

	<div class="mdl-cell mdl-cell--4-col">
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			<input class="mdl-textfield__input" type="text" id="bairro" ng-model="usuario.bairro" maxlength="255" required />
			<label class="mdl-textfield__label" for="bairro">Bairro</label>
		</div>
	</div>

	<div class="mdl-cell mdl-cell--4-col">
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			<input class="mdl-textfield__input" type="text" id="cidade" ng-model="usuario.cidade" maxlength="255" required />
			<label class="mdl-textfield__label" for="cidade">Cidade</label>
		</div>
	</div>
</div>