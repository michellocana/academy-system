<?php $this->load->view('common/_head'); ?>
<body>
	<div id="wrapper" class="toggled">
		<?php $this->load->view('common/_menu'); ?>
		<div id="page-content-wrapper">
			<div class="row">
				<div class="col-md-12">Nome de Usuário: <?php echo $dsNickname ?></div>
				<div class="col-md-12">Nome: <?php echo $dsNome ?></div>
				<div class="col-md-12">Sobrenome: <?php echo $dsSobrenome ?></div>
				<div class="col-md-12">Data de Nascimento: <?php echo $dtNascimento ?></div>
			</div>
		</div>
	</div>
	<?php $this->load->view('common/_footer'); ?>
</body>