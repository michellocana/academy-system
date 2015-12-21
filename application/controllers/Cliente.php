<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Cliente extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('cliente_model');
    }
    
    public function index(){
        $data = array(
            "title" => "Usuário"
        );
        redirect(base_url('usuario/listar'));
    }

    public function cadastro(){
        $data = array(
            "title" => "Cadastro de Cliente"
        );
        $this->load->view('cliente/cadastrar',$data);
    }

    public function cadastrar(){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        $request = $request->cliente;

        $data = array(
            'idUsuario' => $request->idUsuario,
            'peso'      => $request->peso,
            'altura'    => $request->altura,
            'sexo'      => $request->sexo,
            'endereco'  => $request->endereco,
            'numero'    => $request->numero,
            'bairro'    => $request->bairro,
            'cidade'    => $request->cidade,
            'telefone'  => str_replace('_', '', $request->telefone),
        );

        if($return = $this->cliente_model->cadastrarCliente($data))
            print_r(json_encode($return));

    }
}