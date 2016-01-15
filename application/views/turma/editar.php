<div class="mdl-grid">
	<div class="mdl-cell mdl-cell--4-col">
		<h5 class="mtop0 mbot0">Alunos matriculados</h5>
	</div>
</div>
<table id="tableClientesMatriculados" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp mtop30 " ng-cloak>
	<thead>
		<tr>
			<th>Nome</th>
			<th>Email</th>
			<th>Telefone</th>
			<th>Sexo</th>
		</tr>
	</thead>
	<tbody>	
		<tr ng-repeat="cliente in clientes">						
			<td>
				<span class="watchfocus" ng-model='cliente.nomeCliente' ng-keyup="updateAutocomplete()" ng-if="cliente.nomeCliente">
					{{cliente.nomeCliente}}
				</span>
				<a class="empty watchfocus" href="#" ng-if="!cliente.nomeCliente" id="cliente{{cliente.idTurmaCliente}}" ng-model='cliente.nomeCliente' ng-keyup="updateAutocomplete()" ng-focus='clearInput()' contenteditable>Nome do cliente</a>
				<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="cliente{{cliente.idTurmaCliente}}">
					<li class="mdl-menu__item" ng-repeat="clienteMatricula in clientesMatriculas">
						<a href="javascript:;" class="normal-fw" ng-model="cliente.updatecliente" updateturmacliente="{{clienteMatricula.idCliente}}">{{clienteMatricula.nomeCliente}}</a>
					</li>
				</ul>
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
				<a href="#" ng-click="addMatriculaCliente(<?php echo $this->uri->segment(3) ?>)" class="normal-link dspiblock mright10">Matricular aluno</a>
				<a href="#" ng-click="excluirMatriculaCliente()" class="normal-link dspiblock">Remover selecionados</a>
			</td>
		</tr>
	</tfoot>
</table>

