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

	public function getNaoAdms(){
		$query = "SELECT CONCAT(nome, ' ', sobrenome) AS nome, nickname, idUsuario
				  FROM {PRE}usuario 
				  WHERE snTipo = 'FUNC'";

		$naoAdms = $this->db->query($query)->result();

		echo json_encode($naoAdms);
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
		$this->db->where('tipoUsuario', $fields->tipoUsuario);
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
		$this->db->where('tipoUsuario', $fields->tipoUsuario);
		$this->db->update('permissoes', array('acesso' => $updateValue));

		// $this->db->query('DELETE FROM {PRE}atualizacao_permissoes');

		// $this->db->select('idUsuario');
		// $usuarios = $this->db->get('usuario')->result();

		// foreach ($usuarios as $usuario) {
		// 	$this->db->insert('atualizacao_permissoes', array('idUsuario' => intval($usuario->idUsuario), 'atualizado' => 'N'));
		// }


	}

	public function getPermissoes($tipoUsuario){
		$this->db->select('entidade, acao, acesso');
		$this->db->where('tipoUsuario', $tipoUsuario);

		$permissoes = $this->db->get('permissoes')->result();

		return $permissoes;
	}

	public function getEntidades(){
		$entidades = $this->db->query('SELECT DISTINCT entidade FROM {PRE}permissoes')->result();

		return $entidades;
	}

	public function addAdm($idUsuario){
		$this->db->where('idUsuario', $idUsuario);
		$this->db->update('usuario', array('snTipo' => 'ADM'));
	}

	public function checkPermissoesAlteradas(){
		$this->db->select('idUsuario');
		$this->db->where('nickname', $this->session->userdata('nickname'));
		$usuario = $this->db->get('usuario')->result();
		$usuario = $usuario[0];

		$this->db->select('atualizado');
		$this->db->where('idUsuario', $usuario->idUsuario);
		$atualizado = $this->db->get('atualizacao_permissoes')->result();
		$atualizado = $atualizado[0];

		echo json_encode(array('atualizado' => $atualizado->atualizado));
	}
}
