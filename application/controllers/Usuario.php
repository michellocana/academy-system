<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Usuario extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('usuario_model');
    }
    
    public function index(){
        $data = array(
            "title" => "Usuário"
        );
        // fazer o index ir para a lista de usuarios
        $this->load->view('usuario/usuario',$data);
    }

    public function cadastro(){
        $data = array(
            "title" => "Cadastro de Usuário"
        );
        $this->load->view('usuario/cadastro',$data);
    }

    public function cadastrar(){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);

        $data = array(
            'nome'          => $request->nome,
            'sobrenome'     => $request->sobrenome,
            'nickname'      => $request->nickname,
            'dtNascimento'  => $request->dtNascimento,
            'email'         => $request->email,
            'cpf'           => $request->cpf,
            'senha'         => md5($request->senha),
        );

        if($return = $this->usuario_model->cadastrarUsuario($data))
            print_r(json_encode($return));

    }

    public function meusdados(){
        $session = $this->session->all_userdata();

        $this->db->select('nickname, nome, sobrenome, dtNascimento');
        $this->db->where('nickname', $this->session->userdata('nickname'));
        
        $result = $this->db->get('usuario')->result();

        $data = array(
            "title"         => "Meus Dados",
            'nickname'      => $result[0]->nickname,
            'nome'          => $result[0]->nome,
            'sobrenome'     => $result[0]->sobrenome,
            'dtNascimento'  => $result[0]->dtNascimento,
        );

        $this->load->view('usuario/meusdados', $data);
    }

    public function listar(){
        $data = array(
            "title"         => "Lista de Usuários",
        );

        $return = $this->usuario_model->listarUsuarios($data);
        $data['usuarios'] = $return;


        $this->load->view('usuario/lista', $data);
    }
}