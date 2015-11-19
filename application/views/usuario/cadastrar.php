<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-controller="usuario">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<form method="POST" ng-submit='cadastrarUsuario()'>
				<div class="mdl-grid">
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="dsNome" ng-model="usuario.nome" maxlength="255" name="dsNome" required />
							<label class="mdl-textfield__label" for="dsNome">Nome</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="dsSobrenome" ng-model="usuario.sobrenome" maxlength="255" name="dsSobrenome" required />
							<label class="mdl-textfield__label" for="dsSobrenome">Sobrenome</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="dsNickname"  ng-model="usuario.nickname" maxlength="12" name="dsNickname" required />
							<label class="mdl-textfield__label" for="dsNickname">Nome de Usuário</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="dtNascimento" ng-model="usuario.dtNascimento" maxlength="10" name="dtNascimento" required ui-mask="99/99/9999" ui-mask-placeholder ui-mask-placeholder-char="_" />
							<label class="mdl-textfield__label" for="dtNascimento">Data de Nascimento</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="email" id="dsEmail" ng-model="usuario.email" maxlength="255" name="dsEmail" title="Seu endereço de e-mail no formato: exemplo@email.com.br" required />
							<label class="mdl-textfield__label" for="dsEmail">E-mail</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="dsCpf" ng-model="usuario.cpf" maxlength="14" name="dsCpf" required ui-mask="999.999.999-99" ui-mask-placeholder ui-mask-placeholder-char="_"/>
							<label class="mdl-textfield__label" for="dsCpf">CPF</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield">
							<label class="mdl-textfield__input fake-input-file" for="dsFileUsuario">Imagem de perfil (não obrigatória)</label>
							<input type="file" id="dsFileUsuario" ng-model="usuario.dsFile" maxlength="10" name="dsFile" />
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" ng-model='usuario.senha' maxlength="255" name="senha" type="password" required />
							<label class="mdl-textfield__label" for="dsNickname">Senha</label>
						</div>
  					</div>
  					<div class="mdl-cell mdl-cell--4-col">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input"  ng-model='usuario.senha2' maxlength="255" ng-blur='matchPassword()' name="dsRepeatPassword" type="password" title="As senhas dos dois campos devem coincidir." required />
							<label class="mdl-textfield__label" for="dsNickname">Repita a senha</label>
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