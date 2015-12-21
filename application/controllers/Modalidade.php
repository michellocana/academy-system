<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Modalidade extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('modalidade_model');
    }
    
    public function index(){
        $data = array(
            "title" => "Modalidade"
        );

        $this->load->view('modalidade/cadastrar');
    }

    public function listar(){
        if($return = $this->modalidade_model->listarModalidades())
            print_r(json_encode($return));
    }

    public function addRow(){
        echo $this->modalidade_model->addRow();
    }

    public function excluir(){
        $data = getPost();

        $this->modalidade_model->excluir($data->modalidades);
    }

    public function editar(){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        
        $this->modalidade_model->editarModalidade($request);
    }


}