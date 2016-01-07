<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Turma_model extends CI_Model{
	protected $table = 'turma';

	public function __construct(){
		parent::__construct();
	}

	public function listarTurmas(){
		$query = "SELECT t.idTurma, t.sigla, t.capacidade, t.horario, t.statusTurma, t.mensalidade, a.nomeAula, CONCAT(u.nome, ' ', u.sobrenome) as nomeInstrutor
				  FROM {PRE}turma t
				  LEFT JOIN {PRE}usuario u ON u.idUsuario = t.idInstrutor
				  LEFT JOIN {PRE}aula a ON a.idAula = t.idAula";
		$turmas = $this->db->query($query)->result();
		echo json_encode($turmas);
	}

	public function excluir($idTurma){
		$this->db->where('idTurma', $idTurma);
		$this->db->delete('turma');
	}

	public function editarModalidade($modalidade){
		$this->db->where('idModalidade', $modalidade->idModalidade);
		$this->db->update('modalidade', $modalidade);
	}

	public function initJs(){
		$query = "SELECT idUsuario, CONCAT(nome, ' ', sobrenome) as nomeInstrutor
				  FROM {PRE}usuario 
				  WHERE snTipo = 'FUNC'";
		$instrutores = $this->db->query($query)->result();

		$this->db->select('idAula, nomeAula');
		$aulas = $this->db->get('aula')->result();

		$data = array(
			'instrutores' => $instrutores,
			'aulas' => $aulas,
		);

		echo json_encode($data);
	}

	public function cadastrar($turma){
		$data = array(
			'idAula' 		=> $turma->idAula,
			'sigla' 		=> $turma->sigla,
			'capacidade' 	=> $turma->capacidade,
			'horario' 		=> date("H:i:s", strtotime($turma->horario)),
			'idInstrutor' 	=> $turma->idInstrutor,
			'statusTurma' 	=> $turma->statusTurma,
			'mensalidade' 	=> $turma->mensalidade
		);

		$this->db->insert('turma', $data);
	}

	public function alterar($turma){
		$data = array(
			'idAula' 		=> $turma->idAula,
			'sigla' 		=> $turma->sigla,
			'capacidade' 	=> $turma->capacidade,
			'horario' 		=> date("H:i:s", strtotime($turma->horario)),
			'idInstrutor' 	=> $turma->idInstrutor,
			'statusTurma' 	=> $turma->statusTurma,
			'mensalidade' 	=> $turma->mensalidade
		);

		$this->db->where('idTurma', $turma->idTurma);
		$this->db->update('turma', $data);
	}

	public function getInfo($idTurma){
		$query = "SELECT t.idTurma, t.idAula, t.idInstrutor, a.nomeAula, t.sigla, t.capacidade, t.horario, CONCAT(u.nome, ' ', u.sobrenome) as nomeInstrutor, t.statusTurma, t.mensalidade
				  FROM {PRE}turma t
				  LEFT JOIN {PRE}usuario u ON u.idUsuario = t.idInstrutor
				  LEFT JOIN {PRE}aula a ON a.idAula = t.idAula
				  WHERE t.idTurma = " . $idTurma;

		$infoTurma = $this->db->query($query)->result();
		$infoTurma = $infoTurma[0];

		switch ($infoTurma->statusTurma) {
			case 'INSCRICOES ABERTAS':
				$infoTurma->statusTurmaTexto = 'Inscrições abertas';
				break;
			
			case 'INSCRICOES ENCERRADAS':
				$infoTurma->statusTurmaTexto = 'Inscrições encerradas';
				break;
			
			case 'EM ANDAMENTO':
				$infoTurma->statusTurmaTexto = 'Em andamento';
				break;
			
			default:
				$infoTurma->statusTurmaTexto = 'Sem status';
				break;
		}

		echo json_encode($infoTurma);

	}

	public function updateStatus($idTurma, $statusTurma){
		$query = 'UPDATE {PRE}turma SET statusTurma = "' . $statusTurma . '" WHERE idTurma = ' . $idTurma;
		$this->db->query($query);
	}

	public function getClientesMatriculados($idTurma){
		$query = "SELECT CONCAT(u.nome, ' ', u.sobrenome) as nomeCliente, u.email, c.sexo, c.telefone, tc.idTurmaCliente as idTurmaCliente
				  FROM {PRE}turma_cliente tc
				  LEFT JOIN {PRE}cliente c ON c.idCliente = tc.idCliente
				  LEFT JOIN {PRE}usuario u ON c.idUsuario = u.idUsuario
				  WHERE tc.idTurma = " . $idTurma;


		$clientes = $this->db->query($query)->result();

		echo json_encode($clientes);
	}

	public function addMatriculaCliente($idTurma){
		$this->db->insert('turma_cliente', array('idTurma' => $idTurma, 'idCliente' => 0));
	}

	public function getClientesNaoMatriculados($idTurma){
		$query = "SELECT CONCAT(u.nome, ' ', u.sobrenome) as nomeCliente, c.idCliente as idCliente
				  FROM {PRE}usuario u, {PRE}cliente c
				  WHERE u.idUsuario = c.idUsuario
				  AND c.idCliente NOT IN(
				  		SELECT tc.idCliente
				  		FROM {PRE}turma_cliente tc
				  		WHERE idTurma = " . $idTurma . "
				  	)";

		$clientes = $this->db->query($query)->result();

		echo print_r(json_encode($clientes), 1);
	}

}