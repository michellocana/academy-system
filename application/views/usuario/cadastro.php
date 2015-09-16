<?php $this->load->view('common/_head'); ?>
<body ng-controller="academyController">
	<div id="wrapper" class="toggled">
		<?php $this->load->view('common/_menu'); ?>
		<div id="page-content-wrapper">
			<div class="row">
				<form method='POST'>
					<div class="form-group col-md-6">
						<label>Nome</label>
						<input ng-model="academy.dsNome" type="text" class="form-control" name="dsNome" placeholder="Nome" required />
					</div>
					<div class="form-group col-md-6">
						<label>Sobrenome</label>
						<input ng-model="academy.dsSobrenome" type="text" class="form-control" name="dsSobrenome" placeholder="Sobrenome" required />
					</div>
					<div class="form-group col-md-6">
						<label>Nome de usuário</label>
						<input ng-model="academy.dsNickname" type="text" class="form-control" name="dsNickname" placeholder="Nome de Usuário" required />
					</div>
					<div class="form-group col-md-6">
						<label>Data de Nascimento</label>
						<input ng-model="academy.dtNascimento" type="text" class="form-control" name="dtNascimento" placeholder="Data de Nascimento" required />
					</div>
					<div class="form-group col-md-6">
						<label>Senha</label>
						<input ng-model='academy.password' type="password" class="form-control" name="dsPassword" placeholder="Senha" required />
					</div>
					<div class="form-group col-md-6">
						<label>Repita a senha</label>
						<input ng-model='academy.password2' ng-blur='matchPassword()' type="password" class="form-control" name="dsRepeatPassword" title="As senhas dos dois campos devem coincidir." placeholder="Repita a senha" required />
					</div>
					<div class="form-group col-md-2">
						<input ng-click='post()' type="submit" class="form-control btn btn-success" value="Cadastrar" />
					</div>

				</form>
				<div>{{academy}}</div>
			</div>
		</div>
	</div>
	<?php $this->load->view('common/_footer'); ?>
</body>