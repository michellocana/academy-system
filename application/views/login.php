<?php $this->load->view('common/_head'); ?>
<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/login.css') ?>">
<body ng-app='adman' ng-controller="login">
	<form id='formLogin' class="demo-card-square mdl-card mdl-shadow--2dp" method='post'>
		<div class="mdl-card__title mdl-card--expand">
			<h2 class="mdl-card__title-text mdl-color-text--red" ng-bind="loginMessage"></h2>
		</div>
		<div class="mdl-card__supporting-text">
			<div class="mdl-textfield mdl-js-textfield">
				<input class="mdl-textfield__input" type="text" ng-model="login.dsNickname" id="dsNickname" />
				<label class="mdl-textfield__label" for="dsNickname">Nome de usuário</label>
			</div>
			<div class="mdl-textfield mdl-js-textfield">
				<input class="mdl-textfield__input" type="password" ng-model="login.dsPassword" id="dsPassword" />
				<label class="mdl-textfield__label" for="dsNickname">Senha</label>
			</div>
		</div>
		<div class="mdl-card__actions mdl-card--border">
			<button ng-click='login()' class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">Entrar</button>
			<a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect right">Esqueci minha senha</a>
		</div>
	</form>
	<?php $this->load->view('common/_footer'); ?>
	<script src="<?php echo base_url('assets/js/login.js'); ?>"></script>
</body>