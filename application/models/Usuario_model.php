<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Usuario_model extends CI_Model{
	protected $table = 'usuario';

	public function __construct(){
		parent::__construct();
	}

	public function cadastrarUsuario($data = null){
		$returnData = array();
		if(!is_null($data)){
			// Validando se já não existe um usuário com o mesmo nome
			$this->db->where('nickname', $data['nickname']);
			$result = $this->db->get($this->table)->result();

			if(!empty($result)){
				$returnData['status'] = 'error';
    	        $returnData['message'] = 'Nome de usuário "' . $data['nome'] . '" já existente.';
    	        return $returnData;
			}else{
				$returnData['status'] = 'success';
				$returnData['message'] = 'Usuário ' . $data['nome'] . ' cadastrado com sucesso.';
				$this->db->insert($this->table, $data);
				return $returnData;
			}
		}else{
			$returnData['status'] = 'error';
            $returnData['message'] = 'Erro ao cadastrar "' . $data['nome'] . '", por favor, tente novamente.';
			return $returnData;
		}

	}

	public function listarUsuarios(){
		$this->db->select('idUsuario, nickname, nome, sobrenome, snTipo, email');
		$result = $this->db->get($this->table)->result();

		return $result;
	}

	// public function ListAll(){
	// 	$users = $this->db->get($this->table)->result();	
	// 	return $users;
	// }
	
}