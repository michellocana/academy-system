<?php $this->load->view('common/_head'); ?>
<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/login.css') ?>">
<body>
	<div id="fullPage">
		<div class="row">
			<form id='formLogin' action="<?php echo base_url('login/login') ?>" method='post'>
				<h3 class="col-md-12">Login</h3>
				<div class="form-group col-md-12">
					<input class="form-control" type="text" name="dsNickname" required title="Seu nome de usuário." placeholder='Nome de Usuário' />
				</div>
				<div class="form-group col-md-12">
					<input class="form-control" type="password" name="dsPassword" required title="Sua senha." placeholder='Senha' />
				</div>
				<div class="form-group col-md-12">
					<input class="form-control btn btn-success" type="submit" value='Entrar' />
				</div>
			</form>
		</div>
	</div>
</body>
<?php $this->load->view('common/_footer'); ?>