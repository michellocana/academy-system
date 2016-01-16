<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-controller="entrada-saida" resize>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100 full' ng-init="askFullscreen()">
			<form ng-submit="registrarEntradaSaida()" id="formEntradaSaida">	
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
					<input class="mdl-textfield__input" ng-model='dsNomeEntradaSaida' type="text" title="Sua senha de administrador." required />
					<label class="mdl-textfield__label" for="dsNome">Nome de usuário / E-mail</label>
				</div>

				<div class="clearfix"></div>

				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
					<input class="mdl-textfield__input" ng-model='dsPasswordEntradaSaida' type="password" title="Sua senha de administrador." required />
					<label class="mdl-textfield__label" for="dsNome">Senha</label>
				</div>

				<button class="mdl-button mdl-button--colored mdl-button--accent mdl-color--green mdl-button--raised" id="alertify-ok">OK</button>
			</form>
		</main>
	</div>

	<script type="text/requestPassword" id='templateRequestPassword'>	
		<h6 class="w300-centered">Digite sua senha de administrador</h6>

		<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
			<input class="mdl-textfield__input white" type="password" id='admPass' title="Sua senha de administrador." required />
			<label class="mdl-textfield__label white" for="dsNome">Digite sua senha</label>
		</div>

		<div class="clearfix"></div>

	</script>

	<?php $this->load->view('common/_footer'); ?>
</body>