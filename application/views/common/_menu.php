<header id='fixedHeader' class="mdl-layout__header mdl-color--white mdl-color--grey-100 mdl-color-text--grey-600">
	<div class="mdl-layout__header-row">
		<span class="mdl-layout-title"><?php echo (isset($title)) ? $title : "Título da página"; ?></span>
		<div class="mdl-layout-spacer"></div>
		<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
			<label class="mdl-button mdl-js-button mdl-button--icon" for="search">
				<i class="material-icons">search</i>
			</label>
			<div class="mdl-textfield__expandable-holder">
				<input class="mdl-textfield__input" type="text" id="search" placeholder='Digite sua Busca' />
				<label class="mdl-textfield__label" for="search">Digite sua busca</label>
			</div>
		</div>
		<button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
			<i class="material-icons">more_vert</i>
		</button>
		<ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
			<li class="mdl-menu__item">
				<a href="<?php echo base_url('login/logout') ?>">Sair</a>
			</li>
		</ul>
	</div>
</header>
<div class="mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
	<header id='userInfo'>
		<a href="<?php echo base_url() ?>">
			<img src="<?php echo base_url('assets/img/adman-logo.png'); ?>" id="admanLogo">
		</a>
		<div id="dropdownNickname">
			<img src="https://placehold.it/50/FF5722/FFFFFF?text=M" id="profilePhoto">
			<span id='nickname' title="Michell Ocaña">@michellocana</span>
			<div class="mdl-layout-spacer"></div>
			<button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
				<i class="material-icons" role="presentation">arrow_drop_down</i>
			</button>
			<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
				<li class="mdl-menu__item"><a href="<?php echo base_url('usuario/meus-dados') ?>">Meus dados</a></li>
			</ul>
		</div>
	</header>
	<nav id='sideMenu' class="mdl-navigation mdl-color--blue-grey-800">
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == '') echo 'active' ?>" href="<?php echo base_url() ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>Home</a>
		<a class="dropdown mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'usuario') echo 'active' ?>" href="javascript:;"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">face</i>Usuários</a>
		<ul>
			<li>
				<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('usuario/cadastro') ?>">Cadastrar</a>
			</li>
			<li>
				<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('usuario/listar') ?>">Listar</a>
			</li>
		</ul>
		<a class="dropdown mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'equipamento') echo 'active' ?>" href="<?php echo base_url('equipamento') ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">verified_user</i>Equipamentos</a>
		<ul>
			<li>
				<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('equipamento/historico') ?>">Histórico</a>
			</li>
		</ul>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'modalidade') echo 'active' ?>" href="<?php echo base_url('modalidade') ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">extension</i>Modalidades de treino</a>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'aula') echo 'active' ?>" href="<?php echo base_url('aula') ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">class</i>Aulas</a>
		<a class="dropdown mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'turma') echo 'active' ?>" href="javascript:;"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">group_add</i>Turmas</a>
		<ul>
			<li>
				<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('turma/cadastro') ?>">Cadastrar</a>
			</li>
			<li>
				<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('turma/listar') ?>">Listar</a>
			</li>
		</ul>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'grafico') echo 'active' ?>" href="<?php echo base_url() ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">trending_up</i>Gráficos</a>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'notificacoes') echo 'active' ?>" href="<?php echo base_url() ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">announcement</i>Notificações</a>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'configuracoes') echo 'active' ?>" href="<?php echo base_url() ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">settings</i>Configurações</a>
	</nav>
</div>