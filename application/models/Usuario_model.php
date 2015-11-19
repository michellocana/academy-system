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
				$this->db->insert($this->table, $data);

				$this->db->select('idUsuario');
				$this->db->where('nickname', $data['nickname']);

				$idUsuario = $this->db->get($this->table)->result();
				$idUsuario = $idUsuario[0]->idUsuario;

				$returnData['idUsuario'] = $idUsuario;
				$returnData['status'] = 'success';
				$returnData['message'] = 'Usuário ' . $data['nome'] . ' cadastrado com sucesso. Cadastrar informações de cliente para ' . $data['nome'] . '?';
				return $returnData;
			}
		}else{
			$returnData['status'] = 'error';
            $returnData['message'] = 'Erro ao cadastrar "' . $data['nome'] . '", por favor, tente novamente.';
			return $returnData;
		}

	}

	public function alterarUsuario($data = null, $dataCliente = null){
		$this->db->where('idUsuario', $data['idUsuario']);

		if($this->db->update('usuario', $data)){
			if(is_array($dataCliente)){
				// Caso seja do tipo cliente, vai dar update na table de cliente também
				$this->db->where('idUsuario', $data['idUsuario']);

				// echo '<pre>' . print_r($data);die;

				if($this->db->update('cliente', $dataCliente)){
					$returnData['status'] = 'success';
		            $returnData['message'] = 'Usuário alterado com sucesso.';
				}else{
					$returnData['status'] = 'error';
					$returnData['message'] = 'Erro ao alterar "' . $data['nome'] . '", por favor, tente novamente.';
				}
			}else{
				$returnData['status'] = 'success';
	            $returnData['message'] = 'Usuário alterado com sucesso.';
			}

		}else{
			$returnData['status'] = 'error';
            $returnData['message'] = 'Erro ao alterar "' . $data['nome'] . '", por favor, tente novamente.';
		}

		return $returnData;

	}

	public function listarUsuarios(){
		$this->db->select('idUsuario, nickname, nome, sobrenome, snTipo, email');
		$result = $this->db->get($this->table)->result();

		return $result;
	}

	public function excluirUsuario($idUsuario = null){
		$this->db->where('idUsuario', $idUsuario);
		$this->db->delete($this->table);

		// Excluindo dados da tabela de clientes relacionadas a esse usuário também
		$this->db->where('idUsuario', $idUsuario);
		$this->db->delete('cliente');
	}

	public function infoUsuario($idUsuario = null, $isCliente = false){
		if($isCliente){
			$query = "SELECT u.idUsuario, u.nickname, u.dtNascimento, u.nome, u.sobrenome, u.snTipo, u.cpf, u.email, u.imagem,
					  c.idCliente, c.peso, c.altura, c.sexo, c.endereco, c.numero, c.bairro, c.cidade 
					  FROM " . $this->db->dbprefix('usuario') . " AS u, " . $this->db->dbprefix('cliente') . " AS c
					  WHERE c.idUsuario = " . $idUsuario . 
					  ' AND u.idUsuario = c.idUsuario';

			$result = $this->db->query($query)->result();

		}else{
			$this->db->select('idUsuario, nickname, dtNascimento, nome, sobrenome, snTipo, cpf, email, imagem');
			$this->db->where('idUsuario', $idUsuario);
			$result = $this->db->get($this->table)->result();
		}

		// echo $idUsuario; die;
		// echo '<pre> ' . print_r($result,1);die;

		return $result;
	}

}