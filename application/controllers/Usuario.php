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
        $this->load->view('home',$data);
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
            'dsNome'        => $request->dsNome,
            'dsSobrenome'   => $request->dsSobrenome,
            'dsNickname'    => $request->dsNickname,
            'dtNascimento'  => $request->dtNascimento,
            'dsPassword'    => md5($request->dsPassword),
        );

        if($return = $this->usuario_model->cadastrarUsuario($data))
            print_r(json_encode($return));

    }

    public function meusdados(){
        $session = $this->session->all_userdata();

        $this->db->select('dsNickname, dsNome, dsSobrenome, dtNascimento');
        $this->db->where('dsNickname', $this->session->userdata('dsNickname'));
        
        $result = $this->db->get('usuario')->result();

        $data = array(
            'dsNickname' => $result[0]->dsNickname,
            'dsNome' => $result[0]->dsNome,
            'dsSobrenome' => $result[0]->dsSobrenome,
            'dtNascimento' => $result[0]->dtNascimento,
        );

        $this->load->view('usuario/meusdados', $data);
    }
}