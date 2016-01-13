<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Configuracoes_model extends CI_Model{
	protected $table = 'configuracao';

	public function __construct(){
		parent::__construct();
	}

	public function getAdms(){
		$query = "SELECT CONCAT(nome, ' ', sobrenome) AS nome, nickname, idUsuario
				  FROM {PRE}usuario 
				  WHERE snTipo = 'ADM'";

		$adms = $this->db->query($query)->result();

		echo json_encode($adms);
	}

	public function removerPermissao($idUsuario){
		$this->db->where('idUsuario', $idUsuario);
		$this->db->update('usuario', array('snTipo' => 'FUNC'));
	}

	public function getConfigNotificacoes($nickname){
		$this->db->select('notificacaoEquipamentos, notificacaoAulas, notificacaoTurmas, notificacaoEmail');
		$this->db->where('nickname', $nickname);

		$configNotificacoes = $this->db->get('usuario')->result();
		$configNotificacoes = $configNotificacoes[0];

		return $configNotificacoes;
	}

	public function updateNotificacao($field){
		$this->db->select($field);
		$this->db->where('nickname', $this->session->userdata('nickname'));

		$fieldValue = $this->db->get('usuario')->result();
		$fieldValue = $fieldValue[0];

		$key = key($fieldValue);

		foreach ($fieldValue as $fv) {
			$fieldValue = $fv;
		}

		if($fieldValue == 'S'){
			$updateValue = 'N';
		}else{
			$updateValue = 'S';
		}

		$query = "UPDATE {PRE}usuario 
				  SET " . $key . " = '" . $updateValue . "' 
				  WHERE nickname = '" . $this->session->userdata('nickname') . "';";

		$this->db->query($query);
	}

	public function updatePermissao($fields){
		$this->db->select('acesso');
		$this->db->where('entidade', $fields->entidade);
		$this->db->where('acao', $fields->acao);

		$acesso = $this->db->get('permissoes')->result();
		$acesso = $acesso[0];

		if($acesso->acesso == 'S'){
			$updateValue = 'N';
		}else{
			$updateValue = 'S';
		}

		$this->db->where('entidade', $fields->entidade);
		$this->db->where('acao', $fields->acao);
		$this->db->update('permissoes', array('acesso' => $updateValue));

		echo $this->db->last_query();
	}

	public function getPermissoes($tipoUsuario){
		$this->db->select('entidade, acao, acesso');
		$this->db->where('tipoUsuario', $tipoUsuario);

		$permissoes = $this->db->get('permissoes')->result();

		return $permissoes;
	}


}