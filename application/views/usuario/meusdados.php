<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-controller="usuario">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--12-col">
					Nome de Usuário: <?php echo $dsNickname ?>
				</div>
				<div class="mdl-cell mdl-cell--12-col">
					Nome: <?php echo $dsNome ?>
				</div>
				<div class="mdl-cell mdl-cell--12-col">
					Sobrenome: <?php echo $dsSobrenome ?>
				</div>
				<div class="mdl-cell mdl-cell--12-col">
					Data de Nascimento: <?php echo $dtNascimento ?>
				</div>
			</div>
		</main>
	</div>

	<?php $this->load->view('common/_footer'); ?>
</body>
