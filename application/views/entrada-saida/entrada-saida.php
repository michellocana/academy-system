<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-controller="entrada-saida" resize>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100 full' ng-init="askFullscreen()">

		</main>
	</div>

	<script type="text/requestPassword" id='templateRequestPassword'>
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			<input class="mdl-textfield__input white" type="password" title="Sua senha de administrador." required />
			<label class="mdl-textfield__label white" for="dsNome">Digite sua senha</label>
		</div>

		<div class="clearfix"></div>

		<button class="mdl-button mdl-button--colored mdl-button--accent mdl-color--green mdl-button--raised">OK</button>
	</script>

	<?php $this->load->view('common/_footer'); ?>
</body>