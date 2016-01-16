<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Mensalidade_model extends CI_Model{
	protected $table = 'mensalidade';

	public function __construct(){
		parent::__construct();
	}

	public function listarMensalidades($idUsuario){
		if ($idUsuario) {
			$query = "SELECT   m.idMensalidade,
						       m.idUsuario,
						       m.dtMensalidade,
						       m.valor,
						       CONCAT(u.nome, ' ', u.sobrenome) AS nomeFuncionario
						FROM {PRE}mensalidade m
						INNER JOIN {PRE}usuario u ON u.idUsuario = m.idUsuario
						WHERE u.idUsuario = " . $idUsuario;
			return $this->db->query($query)->result();
		}
		return null;
	}

	public function addRow($idUsuario){
		$query = "SELECT auto_increment FROM INFORMATION_SCHEMA.TABLES WHERE table_name = '{PRE}mensalidade'";

		$lastId = $this->db->query($query)->result();
		$lastId = $lastId[0]->auto_increment;

		$this->db->insert('mensalidade', array('idMensalidade' => $lastId, 'idUsuario' => $idUsuario));
		
		return $lastId;
	}

	public function editarMensalidade($mensalidade){
		$this->db->where('idMensalidade', $mensalidade->idMensalidade);
		$this->db->update($this->table, $mensalidade);
	}

}