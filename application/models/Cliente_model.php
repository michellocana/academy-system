<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Cliente_model extends CI_Model{
	protected $table = 'cliente';

	public function __construct(){
		parent::__construct();
	}

	public function cadastrarCliente($data = null){
		$returnData = array();

		// Atualizando usuário para tipo "cliente"
		$snTipo = array(
			'snTipo' => '"CLI"',
		);

		$this->db->where('idUsuario', $data['idUsuario']);
		$this->db->update('usuario',$snTipo);

		if($this->db->insert($this->table, $data)){
			$returnData['status'] = 'success';
			$returnData['message'] = 'Cadastro realizado com sucesso.';
		}
		

		return $returnData;

	}

}