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
			$this->db->where('dsNickname', $data['dsNickname']);
			$result = $this->db->get('usuario')->result();

			if(!empty($result)){
				$returnData['status'] = 'error';
    	        $returnData['message'] = 'Nome de usuário "' . $data['dsNome'] . '" já existente.';
    	        return $returnData;
			}else{
				$returnData['status'] = 'success';
				$returnData['message'] = 'Usuário ' . $data['dsNome'] . ' cadastrado com sucesso.';
				$this->db->insert($this->table, $data);
				return $returnData;
			}
		}else{
			$returnData['status'] = 'error';
            $returnData['message'] = 'Erro ao cadastrar "' . $data['dsNome'] . '", por favor, tente novamente.';
			return $returnData;
		}

	}

	// public function ListAll(){
	// 	$users = $this->db->get($this->table)->result();	
	// 	return $users;
	// }
	
}