<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-controller="usuario">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<form method="POST">
				<div class="mdl-grid">
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield">
							<input class="mdl-textfield__input" type="text" id="dsNome" ng-model="usuario.dsNome" maxlength="255" name="dsNome" required />
							<label class="mdl-textfield__label" for="dsNome">Nome</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield">
							<input class="mdl-textfield__input" type="text" id="dsSobrenome" ng-model="usuario.dsSobrenome" maxlength="255" name="dsSobrenome" required />
							<label class="mdl-textfield__label" for="dsSobrenome">Sobrenome</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield">
							<input class="mdl-textfield__input" type="text" id="dsNickname"  ng-model="usuario.dsNickname" maxlength="12" name="dsNickname" required />
							<label class="mdl-textfield__label" for="dsNickname">Nome de Usuário</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield">
							<input class="mdl-textfield__input" type="text" id="dtNascimento" ng-model="usuario.dtNascimento" maxlength="10" class="date-input" name="dtNascimento" required />
							<label class="mdl-textfield__label" for="dtNascimento">Data de Nascimento</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield">
							<input class="mdl-textfield__input" ng-model='usuario.dsPassword' maxlength="255" name="dsPassword" type="password" required />
							<label class="mdl-textfield__label" for="dsNickname">Senha</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield">
							<input class="mdl-textfield__input"  ng-model='usuario.dsPassword2' maxlength="255" ng-blur='matchPassword()' name="dsRepeatPassword" type="password"  title="As senhas dos dois campos devem coincidir." required />
							<label class="mdl-textfield__label" for="dsNickname">Repita a senha</label>
						</div>
  					</div>
  					<div class="form-options">
	  					<button ng-click='cadastrarUsuario()' class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--green mdl-color-text--white ">
	  						<i class="material-icons">done</i>
						</button>
  					</div>
  					<div class="form-options">
	  					<a href="<?php echo base_url('usuario') ?>" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
	  						<i class="material-icons">clear</i>
						</a>
  					</div>
  				</div>
			</form>
		</main>
	</div>

	<?php $this->load->view('common/_footer'); ?>
</body>