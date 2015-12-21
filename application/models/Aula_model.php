<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Aula_model extends CI_Model{
	protected $table = 'aula';

	public function __construct(){
		parent::__construct();
	}

	public function listarAulas(){
		$query = "SELECT a.idAula, m.nomeModalidade as nomeModalidade, a.descricaoAula, a.nomeAula
				  FROM {PRE}aula a
				  LEFT JOIN {PRE}modalidade AS m ON (m.idModalidade = a.idModalidade)";
		$aulas = $this->db->query($query)->result();

		return $aulas;
	}

	public function addRow(){
		$query = "SELECT auto_increment FROM INFORMATION_SCHEMA.TABLES WHERE table_name = '{PRE}aula'";

		$lastId = $this->db->query($query)->result();
		$lastId = $lastId[0]->auto_increment;

		$this->db->insert('aula', array('idAula' => $lastId));
		
		return $lastId;
	}

	public function excluir($aulas){
		$this->db->where_in('idAula', $aulas);
		$this->db->delete('aula');
	}

	public function editarAula($aula){
		$this->db->where('idAula', $aula->idAula);
		$this->db->update($this->table, $aula);
	}

	public function listarModalidades(){
		$this->db->select('idModalidade, nomeModalidade');
		$modalidades = $this->db->get('modalidade')->result();

		$modalidades = json_encode($modalidades);

		return $modalidades;
	}

	public function updateModalidade($idAula, $idModalidade){
		$this->db->where('idAula', $idAula);
		$this->db->update('aula', array('idModalidade' => $idModalidade));

		$this->db->select('nomeModalidade');
		$this->db->where('idModalidade', $idModalidade);
		$nomeModalidade = $this->db->get('modalidade')->result();
		$nomeModalidade = $nomeModalidade[0];

		echo json_encode($nomeModalidade);
	}


}