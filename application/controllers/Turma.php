<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Turma extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('turma_model');
    }
    
    public function index(){
        redirect(base_url('turma/listar'));
    }

    public function cadastro(){
        $data = array(
            "title" => "Cadastro de Turma"
        );

        $this->load->view('turma/cadastrar');
    }

    public function editar(){
        $data = array(
            "title" => "Editar Turma"
        );

        $this->load->view('turma/cadastrar');
    }

    public function listar(){
        $data = array(
            "title" => "Turma"
        );

        $this->load->view('turma/listar');
    }

    public function listarTurmas(){
        if($return = $this->turma_model->listarTurmas())
            print_r(json_encode($return));
    }

    public function excluir(){
        $data = getPost();

        $this->turma_model->excluir($data);
    }

    public function initJs(){
        $this->turma_model->initJs();
    }

    public function cadastrar(){
        $data = getPost();

        $this->turma_model->cadastrar($data);
    }

    public function getInfo(){
        $idTurma = getPost();

        $this->turma_model->getInfo($idTurma);
    }

    public function alterar(){
        $turma = getPost();

        $this->turma_model->alterar($turma);
    }

    public function updateStatus(){
        $turma = getPost();

        $this->turma_model->updateStatus($turma->idTurma, $turma->statusTurma);
    }

    public function getClientesMatriculados(){
        $idTurma = getPost();

        $this->turma_model->getClientesMatriculados($idTurma);
    }

    public function addMatriculaCliente(){
        $idTurma = getPost();
        $this->turma_model->addMatriculaCliente($idTurma);
    }

    public function getClientesNaoMatriculados(){
        $idTurma = getPost();
        $this->turma_model->getClientesNaoMatriculados($idTurma);
    }

    public function updateTurmaCliente(){
        $turmaCliente = getPost();
        $this->turma_model->updateTurmaCliente($turmaCliente);        
    }

    public function excluirMatriculaCliente(){
        $data = getPost();
        $this->turma_model->excluirMatriculaCliente($data->clientes, $data->idTurma);
    }
}