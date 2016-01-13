<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Configuracoes extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('configuracoes_model');
    }
    
    public function index(){
        $nickname = $this->session->userdata('nickname');

        $configuracao = $this->configuracoes_model->getConfigNotificacoes($nickname);

        $data = array(
            "title" => "Configurações",
            "config" => $configuracao,
        );

        $permissoesFunc = $this->configuracoes_model->getPermissoes('FUNC');

        foreach ($permissoesFunc as $pf) {
            $key = $pf->acao;
            $key .= $pf->entidade;

            $key = strtolower($key);
            $key = str_replace('-', '', $key);

            $data[$key] = ($pf->acesso == 'S') ? 'checked' : '';
        }

        $this->load->view('configuracoes/configuracao', $data);
    }

    public function getAdms(){
        return $this->configuracoes_model->getAdms();
    }

    public function removerPermissao(){
        $idUsuario = getPost();
        $this->configuracoes_model->removerPermissao($idUsuario);
    }

    public function updateNotificacao(){
        $field = getPost();

        $this->configuracoes_model->updateNotificacao($field->field);
    }

    public function updatePermissao(){
        $fields = getPost();    

        $this->configuracoes_model->updatePermissao($fields);
    }
}