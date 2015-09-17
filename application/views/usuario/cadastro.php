<?php $this->load->view('common/_head'); ?>
<body ng-controller="usuarioController">
	<div id="wrapper" class="toggled">
		<?php $this->load->view('common/_menu'); ?>
		<div id="page-content-wrapper">
			<div class="row">
				<form method='POST'>
					<div class="form-group col-md-6">
						<label>Nome</label>
						<input ng-model="usuario.dsNome" maxlength="255" type="text" class="form-control" name="dsNome" placeholder="Nome" required />
					</div>
					<div class="form-group col-md-6">
						<label>Sobrenome</label>
						<input ng-model="usuario.dsSobrenome" maxlength="255"  type="text" class="form-control" name="dsSobrenome" placeholder="Sobrenome" required />
					</div>
					<div class="form-group col-md-6">
						<label>Nome de usuário</label>
						<input ng-model="usuario.dsNickname" maxlength="12" type="text" class="form-control" name="dsNickname" placeholder="Nome de Usuário" required />
					</div>
					<div class="form-group col-md-6">
						<label>Data de Nascimento</label>
						<input ng-model="usuario.dtNascimento" maxlength="10"  type="text" class="form-control date-input" name="dtNascimento" placeholder="Data de Nascimento" required />
					</div>
					<div class="form-group col-md-6">
						<label>Senha</label>
						<input ng-model='usuario.dsPassword' maxlength="255" type="password" class="form-control" name="dsPassword" placeholder="Senha" required />
					</div>
					<div class="form-group col-md-6">
						<label>Repita a senha</label>
						<input ng-model='usuario.dsPassword2' maxlength="255" ng-blur='matchPassword()' type="password" class="form-control" name="dsRepeatPassword" title="As senhas dos dois campos devem coincidir." placeholder="Repita a senha" required />
					</div>
					<div class="form-group col-md-2">
						<input ng-click='cadastrarUsuario()' type="submit" class="form-control btn btn-success" value="Cadastrar" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<?php $this->load->view('common/_footer'); ?>
</body>