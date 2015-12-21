<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Modalidade_model extends CI_Model{
	protected $table = 'modalidade';

	public function __construct(){
		parent::__construct();
	}

	public function listarModalidades(){
		$this->db->select('idModalidade, nomeModalidade');
		$modalidades = $this->db->get('modalidade')->result();

		return $modalidades;
	}

	public function addRow(){
		$query = "SELECT auto_increment FROM INFORMATION_SCHEMA.TABLES WHERE table_name = '{PRE}modalidade'";

		$lastId = $this->db->query($query)->result();
		$lastId = $lastId[0]->auto_increment;

		$this->db->insert('modalidade', array('idModalidade' => $lastId));
		
		return $lastId;
	}

	public function excluir($modalidades){
		$this->db->where_in('idModalidade', $modalidades);
		$this->db->delete('modalidade');
	}

	public function editarModalidade($modalidade){
		// echo '<pre>' . print_r($modalidade);
		$this->db->where('idModalidade', $modalidade->idModalidade);
		$this->db->update('modalidade', $modalidade);
	}



}