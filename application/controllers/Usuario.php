<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Usuario extends CI_Controller {

    public function __construct() {
        parent::__construct();
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
        // O POST TÁ VINDO CERTO, SÓ NÃO TÁ TENDO PERMISSÃO PARA FAZER AS COISAS, SEI LÁ POR QUE
        // $obj = json_decode(file_get_contents('php://input'));
        // echo $obj->dsNome;die;

        $data = array(
            'dsNome'        => 'dsNome',
            'dsSobrenome'   => 'dsSobrenome',
            'dsNickname'    => 'dsNickname',
            'dtNascimento'  => 'dtNascimento',
            'dsPassword'    => 'dsPassword',
        );

        // echo $data;die;

        $this->db->insert('usuario', $data);

        echo "deu";
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