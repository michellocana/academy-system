<?php $this->load->view('common/_head'); ?>
<body ng-app='adman' ng-controller="usuario">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<?php $this->load->view('common/_menu'); ?>
		<main class='mdl-layout__content mdl-color--grey-100'>
			<table class="mdl-data-table mdl-shadow--2dp mtop30">
				<thead>
					<tr>
						<th>#</th>
						<th>Nome de usuário</th>
						<th>Nome</th>
						<th>Sobrenome</th>
						<th>Tipo</th>
						<th>E-mail</th>
						<th>Opções</th>
					</tr>
				</thead>
				<tbody>	
					<?php foreach($usuarios as $u): ?>
					<tr>
						<td><?php echo $u->idUsuario ?></td>
						<td><?php echo $u->nickname ?></td>
						<td><?php echo $u->nome ?></td>
						<td><?php echo $u->sobrenome ?></td>
						<td><?php echo strip_quotation_marks($u->snTipo) ?></td>
						<td><?php echo $u->email ?></td>
						<td>
							<a href="<?php echo base_url('usuario/editar') . '/' . $u->idUsuario ?>" class="mdl-button small mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
								Editar
							</a>
							<a ng-click="excluir(<?php echo $u->idUsuario ?>, '<?php echo $u->nome ?>')" class="mdl-button small mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
								Excluir
							</a>
						</td>
					</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
		</main>
	</div>

	<?php $this->load->view('common/_footer'); ?>
</body>

