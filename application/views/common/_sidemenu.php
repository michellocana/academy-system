<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == '') echo 'active' ?>" href="<?php echo base_url() ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>Home</a>
<?php 
	// Begin usuário 
	if(checkVisualizar('usuario')):
?>
<a class="dropdown mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'usuario') echo 'active' ?>" href="javascript:;"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">face</i>Usuários</a>
<ul>
	<?php 
		// Cadastrar usuário 
		if($this->permissoes->usuario->adicionar):
	?>
	<li>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('usuario/cadastro') ?>">Cadastrar</a>
	</li>
	<?php endif; ?>
	<li>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('usuario/listar') ?>">Listar</a>
	</li>
</ul>
<?php 
	endif;
	// End usuário 
?>

<?php 
	// Begin equipamento 
	if(checkVisualizar('equipamento')):
?>
<a class="dropdown mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'equipamento') echo 'active' ?>" href="<?php echo base_url('equipamento') ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">verified_user</i>Equipamentos</a>
<ul>
	<li>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('equipamento/historico') ?>">Histórico</a>
	</li>
</ul>
<?php 
	endif;
	// End equipamento 
?>

<?php 
	// Begin modalidade de treino 
	if(checkVisualizar('modalidade_de_treino')):
?>
<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'modalidade') echo 'active' ?>" href="<?php echo base_url('modalidade') ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">extension</i>Modalidades de treino</a>
<?php 
	endif;
	// End modalidade de treino 
?>

<?php 
	// Begin aula 
	if(checkVisualizar('aula')):
?>
<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'aula') echo 'active' ?>" href="<?php echo base_url('aula') ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">class</i>Aulas</a>
<?php 
	endif;
	// End aula 
?>

<?php 
	// Begin turma 
	if(checkVisualizar('turma')):
?>
<a class="dropdown mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'turma') echo 'active' ?>" href="javascript:;"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">group_add</i>Turmas</a>
<ul>
	<?php if ($this->permissoes->turma->adicionar): ?>
	<li>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('turma/cadastro') ?>">Cadastrar</a>
	</li>
	<?php endif ?>
	<li>
		<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect" href="<?php echo base_url('turma/listar') ?>">Listar</a>
	</li>
</ul>
<?php 
	endif;
	// End turma 
?>

<?php 
	// Begin gráfico 
	if(checkVisualizar('grafico')):
?>
<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'grafico') echo 'active' ?>" href="<?php echo base_url() ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">trending_up</i>Gráficos</a>
<?php 
	endif;
	// End gráfico 
?>

<?php 
	// Begin notificações 
?>
<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'notificacoes') echo 'active' ?>" href="<?php echo base_url() ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">announcement</i>Notificações</a>
<?php // End notificações ?>

<?php // Begin entrada/saída
	if(checkVisualizar('entrada-saida')):
?>
<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'entrada-saida') echo 'active' ?>" href="<?php echo base_url('entrada-saida') ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">assignment_ind</i>Entrada/Saída</a>
<?php 
	endif;
	// End entrada/saída 
?>

<?php // Begin configurações ?>
<a class="mdl-navigation__link mdl-button mdl-js-button mdl-js-ripple-effect <?php if($this->uri->segment(1) == 'configuracoes') echo 'active' ?>" href="<?php echo base_url('configuracoes') ?>"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">settings</i>Configurações</a>
<?php // End configurações ?>
