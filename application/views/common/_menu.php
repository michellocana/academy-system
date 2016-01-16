<header id='fixedHeader' class="mdl-layout__header mdl-color--white mdl-color--grey-100 mdl-color-text--grey-600 <?php if($this->uri->segment(1) == 'entrada-saida'){ echo 'full'; } ?>">
	<div class="mdl-layout__header-row">
		<span class="mdl-layout-title"><?php echo (isset($title)) ? $title : "Título da página"; ?></span>
		<div class="mdl-layout-spacer"></div>

		<?php if($this->uri->segment(1) != 'entrada-saida'){ ?>
		<button class="mdl-button mdl-js-button mdl-button--icon" id="notificationsTopHeader">
			<span class="material-icons mdl-badge" data-badge="1">speaker_notes</span>
		</button>
		<ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="notificationsTopHeader">
			<li class="mdl-menu__item">
				<a href="#">Breve descrição da notificação</a>
			</li>
			<li class="mdl-menu__item">
				<a href="#">Breve descrição da notificação</a>
			</li>
			<li class="mdl-menu__item">
				<a href="#">Breve descrição da notificação</a>
			</li>
			<li class="mdl-menu__item">
				<a href="#">Breve descrição da notificação</a>
			</li>
			<li class="mdl-menu__item">
				<a href="#">Breve descrição da notificação</a>
			</li>
		</ul>
		
		<?php /*
		<div id="searchTopHeader" class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
			<label class="mdl-button mdl-js-button mdl-button--icon" for="search">
				<i class="material-icons">search</i>
			</label>
			<div class="mdl-textfield__expandable-holder">
				<input class="mdl-textfield__input" type="text" id="search" placeholder='Digite sua Busca' />
				<label class="mdl-textfield__label" for="search">Digite sua busca</label>
			</div>
		</div>
		*/ ?>

		<button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="moreTopHeader">
			<i class="material-icons">more_vert</i>
		</button>
		<ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="moreTopHeader">
			<li class="mdl-menu__item">
				<a href="<?php echo base_url('login/logout') ?>">Sair</a>
			</li>
		</ul>
		<?php }else{ ?>
		<button ng-click='home()' class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="homeTopHeader">
			<span class="material-icons">home</span>
		</button>
		<button ng-if='isFullscreen' ng-click="fullscreenCancel()" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="fullscreenTopHeader">
			<span class="material-icons">fullscreen</span>
		</button>
		<button ng-if='!isFullscreen' ng-click="fullscreenRequest()" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="fullscreenTopHeader">
			<span class="material-icons">fullscreen</span>
		</button>
		<?php } ?>

	</div>
</header>
<?php if($this->uri->segment(1) != 'entrada-saida'){ ?>
<div class="mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
	<header id='userInfo'>
		<a href="<?php echo base_url() ?>">
			<img src="<?php echo base_url('assets/img/adman-logo.png'); ?>" id="admanLogo">
		</a>
		<div id="dropdownNickname">
			<img src="https://placehold.it/50/FF5722/FFFFFF?text=M" id="profilePhoto">
			<span id='nicknameMenu' title="<?php echo $this->session->userdata('nickname') ?>">@<?php echo $this->session->userdata('nickname') ?></span>
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
		<?php $this->load->view('common/_sidemenu') ?>
	</nav>
</div>
<?php } ?>