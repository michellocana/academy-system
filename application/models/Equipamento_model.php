<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Equipamento_model extends CI_Model{
	protected $table = 'equipamento';

	public function __construct(){
		parent::__construct();
	}

	public function listarEquipamentos(){
		$query = "SELECT e.idEquipamento, e.nomeEquipamento, e.idModalidade, m.nomeModalidade, e.descricaoEquipamento, e.snAtivo AS snAtivo, e.statusEquipamento 
				  FROM {PRE}equipamento  AS e
				  LEFT JOIN {PRE}modalidade AS m ON (m.idModalidade = e.idModalidade)";


		$result = $this->db->query($query)->result();

		return $result;
	}

	public function editarEquipamento($equipamento){
		$this->db->where('idEquipamento',$equipamento->idEquipamento);
		$this->db->update('equipamento', $equipamento);
	}

	public function addRow(){
		$query = "SELECT auto_increment FROM INFORMATION_SCHEMA.TABLES WHERE table_name = '{PRE}equipamento'";

		$lastId = $this->db->query($query)->result();
		$lastId = $lastId[0]->auto_increment;

		$this->db->insert('equipamento', array('idEquipamento' => $lastId,'snAtivo'=>'INATIVO'));
		
		return $lastId;
	}

	public function switchAtivo($idEquipamento){
		$this->db->select('snAtivo');
		$this->db->where('idEquipamento', $idEquipamento);
		$result = $this->db->get('equipamento')->result();

		if($result[0]->snAtivo == 'ATIVO'){
			$data = array('snAtivo' => 'INATIVO');
			$ativadoDesativado = "desativado";
		}elseif($result[0]->snAtivo == 'INATIVO'){
			$data = array('snAtivo' => 'ATIVO');
			$ativadoDesativado = "ativado";
		}

		$this->db->where('idEquipamento', $idEquipamento);
		$this->db->update('equipamento', $data);

		$data = array(
			'mensagemLogEquipamento'	=> 'O equipamento foi ' . $ativadoDesativado . '.',
		);

		echo json_encode($data);
	}

	public function excluir($equipamentos){
		$this->db->where_in('idEquipamento', $equipamentos);
		$this->db->delete('equipamento');
	}

	public function listarModalidades(){
		$this->db->select('idModalidade, nomeModalidade');
		$modalidades = $this->db->get('modalidade')->result();

		$modalidades = json_encode($modalidades);

		return $modalidades;
	}

	public function updateModalidade($idEquipamento, $idModalidade){
		$this->db->where('idEquipamento', $idEquipamento);
		$this->db->update('equipamento', array('idModalidade' => $idModalidade));

		$this->db->select('nomeModalidade');
		$this->db->where('idModalidade', $idModalidade);
		$nomeModalidade = $this->db->get('modalidade')->result();
		$nomeModalidade = $nomeModalidade[0];

		echo json_encode($nomeModalidade);
	}

	public function updateStatus($idEquipamento, $statusEquipamento){
		$this->db->where('idEquipamento', $idEquipamento);
		$this->db->update('equipamento', array('statusEquipamento' => $statusEquipamento));

		$this->db->select('nomeEquipamento');
		$this->db->where('idEquipamento', $idEquipamento);
		$nomeEquipamento = $this->db->get('equipamento')->result();
		$nomeEquipamento = $nomeEquipamento[0];

		echo json_encode($nomeEquipamento);
	}

	public function log($data){
		$data = array(
			'idEquipamento' 			=> $data->idEquipamento,
			'infoLogEquipamento' 		=> $data->infoLogEquipamento,
			'mensagemLogEquipamento' 	=> $data->mensagemLogEquipamento,
			'dataLogEquipamento' 		=> date('Y-m-d H:i:s'),
		);

		$this->db->insert('log_equipamento', $data);
	}

	public function listarLogs(){
		$query = "	SELECT le.idLogEquipamento, le.mensagemLogEquipamento, le.infoLogEquipamento, le.dataLogEquipamento, e.nomeEquipamento
					FROM {PRE}log_equipamento le, {PRE}equipamento e
					WHERE le.idEquipamento = e.idEquipamento
					ORDER BY le.dataLogEquipamento DESC";

		$logs = $this->db->query($query)->result();

		foreach ($logs as $l) {
			$l->dataLogEquipamento = str_replace('-', '/', date("d-m-Y H:i:s", strtotime($l->dataLogEquipamento)));
		}

		echo json_encode($logs);
	}

}