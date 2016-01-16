<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Mensalidade extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('mensalidade_model');
    }
    
    public function index(){
        $data = array(
            "title" => "Mensalidades"
        );

        $this->load->view('mensalidade/cadastrar');
    }

    public function cadastrar($idUsuario = null){
    	if(!is_null($idUsuario)){
    		$mensalidades = listar($idUsuario);
    		echo '<pre>' . print_r($mensalidades, 1);die;
    	}else{
    		redirect(base_url());
    	}
    }

    public function editar(){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        
        $this->mensalidade_model->editarMensalidade($request);
    }

    public function listar($idUsuario){
    	return $this->mensalidade_model->listarMensalidades($idUsuario);
    }

    // public function listar(){
    	// $post = getPost();
        // if($return = $this->mensalidade_model->listarMensalidades($post->idUsuario))
            // print_r(json_encode($return));
    // }

    public function addRow(){
    	$post = getPost();
        echo $this->mensalidade_model->addRow($post->idUsuario);
    }

}