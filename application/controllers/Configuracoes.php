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
            $key = str_replace('_', '', $key);

            $data[$key] = ($pf->acesso == 'S') ? 'checked' : '';
        }

        $this->load->view('configuracoes/configuracao', $data);
    }

    public function getAdms(){
        return $this->configuracoes_model->getAdms();
    }

    public function getNaoAdms(){
        return $this->configuracoes_model->getNaoAdms();
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

    public function addAdm(){
        $idUsuario = getPost();
        $this->configuracoes_model->addAdm($idUsuario);
    }

    public function getMenu(){
        $html = $this->load->view('common/_sidemenu', true);
        echo json_encode($html);
    }

    public function checkPermissoesAlteradas(){
        $this->configuracoes_model->checkPermissoesAlteradas();
    }
 
}