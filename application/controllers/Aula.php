<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Aula extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('aula_model');
    }
    
    public function index(){
        $data = array(
            "title" => "Aula"
        );

        $this->load->view('aula/cadastrar');
    }

    public function listar(){
        if($return = $this->aula_model->listarAulas())
            print_r(json_encode($return));
    }

    public function addRow(){
        echo $this->aula_model->addRow();
    }

    public function excluir(){
        $data = getPost();

        $this->aula_model->excluir($data->aulas);
    }

    public function editar(){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        
        $this->aula_model->editarAula($request);
    }

    public function listarModalidades(){
        echo $this->aula_model->listarModalidades();
    }

    public function updateModalidade(){
        $data = getPost();

        $this->aula_model->updateModalidade($data->idAula, $data->idModalidade);
    }

}