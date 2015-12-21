<div class="mdl-grid">
	<div class="mdl-cell mdl-cell--4-col">
		<h5 class="mtop0 mbot0">Alunos matriculados</h5>
	</div>
</div>
<table id="tableClientesMatriculados" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp mtop30 " ng-cloak>
	<thead>
		<tr>
			<th>#</th>
			<th>Nome</th>
		</tr>
	</thead>
	<tbody>	
		<tr ng-repeat="cliente in clientes">						
			<td>
				{{cliente.nomeCliente}}
			</td>
			<td>
				{{cliente.email}}
			</td>
			<td>
				{{cliente.telefone}}
			</td>
			<td>
				{{cliente.sexo}}
			</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">	
				<div class="form-options">
					<button ng-click="addRow()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--green mdl-color-text--white">
						<i class="material-icons">add</i>
					</button>
				</div>

				<div class="form-options">								
					<button ng-click="excluirModalidade()" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-color--red mdl-color-text--white">
						<i class="material-icons">delete</i>
					</button>
				</div>
			</td>
		</tr>
	</tfoot>
</table>

