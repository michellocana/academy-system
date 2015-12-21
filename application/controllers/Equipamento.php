<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Equipamento extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('equipamento_model');
    }
    
    public function index(){
        $data = array(
            "title" => "Equipamento"
        );

        $this->load->view('equipamento/cadastrar');
    }

    public function historico(){
        $data = array(
            "title" => "Equipamento - Histórico"
        );

        $this->load->view('equipamento/historico');
    }


    public function editar(){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        
        $this->equipamento_model->editarEquipamento($request);
    }

    public function listar(){
        if($return = $this->equipamento_model->listarEquipamentos())
            print_r(json_encode($return));
    }

    public function addRow(){
        echo $this->equipamento_model->addRow();
    }

    public function switchAtivo(){
        $data = getPost();

        $this->equipamento_model->switchAtivo($data->idEquipamento);
    }

    public function excluir(){
        $data = getPost();

        $this->equipamento_model->excluir($data->equipamentos);
    }

    public function listarModalidades(){
        echo $this->equipamento_model->listarModalidades();
    }

    public function updateModalidade(){
        $data = getPost();

        $this->equipamento_model->updateModalidade($data->idEquipamento, $data->idModalidade);
    }

    public function updateStatus(){
        $data = getPost();

        $this->equipamento_model->updateStatus($data->idEquipamento, $data->statusEquipamento);
    }

    public function log(){
        $data = getPost();

        $this->equipamento_model->log($data);
    }

    public function listarLogs(){
        $this->equipamento_model->listarLogs();
    }
}