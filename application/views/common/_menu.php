<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<button id="menu-toggle" type="button" class="navbar-toggle collapsed">
				<span class="sr-only"></span>
				<span class="glyphicon glyphicon-th-list"></span>
			</button>
			<a class="navbar-brand" href="<?php echo base_url() ?>">
				<img src="https://placehold.it/50x50/f8f8f8/000000?text=A.S.">
			</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse" aria-expanded="false">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Minha Conta <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<?php echo base_url('usuario/meus-dados'); ?>">Meus Dados</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="<?php echo base_url('login/logout') ?>">Sair</a></li>
					</ul>
				</li>
			</ul>
			<form class="navbar-form navbar-right">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Procurar">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit"><i class='glyphicon glyphicon-search'></i></button>
					</span>
				</div>
			</form>
		</div>
	</div>
</nav>

<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li>
			<a href="<?php echo base_url('usuario/cadastro') ?>"><i class='glyphicon glyphicon-user'></i> Usuário</a>
		</li>
	</ul>
</div>