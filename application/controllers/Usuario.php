<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Usuario extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('usuario_model');

        if(!checkVisualizar('usuario'))
            redirect(base_url());
    }
    
    public function index(){

        $data = array(
            "title" => "Usuário"
        );
        redirect(base_url('usuario/listar'));
    }

    public function cadastro(){
        if($this->permissoes->usuario->adicionar){
            $data = array(
                "title" => "Cadastro de Usuário"
            );
            $this->load->view('usuario/cadastrar',$data);
        }else{
            rdrHome();
        }
    }

    public function cadastrar(){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        $request = $request->usuario;

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

    public function alterar($isCliente = false){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        $usuario = $request->usuario;
        $isCliente = $request->isCliente;

        $data = array(
            'idUsuario'     => $usuario->idUsuario,
            'nome'          => $usuario->nome,
            'sobrenome'     => $usuario->sobrenome,
            'nickname'      => $usuario->nickname,
            'dtNascimento'  => $usuario->dtNascimento,
            'email'         => $usuario->email,
            'cpf'           => $usuario->cpf,
        );

        if($isCliente == 'true'){
            $dataCliente = array(
                'peso'      => $usuario->peso, 
                'altura'    => $usuario->altura, 
                'sexo'      => $usuario->sexo, 
                'endereco'  => $usuario->endereco, 
                'numero'    => $usuario->numero, 
                'bairro'    => $usuario->bairro, 
                'cidade'    => $usuario->cidade, 
            );

            if($return = $this->usuario_model->alterarUsuario($data, $dataCliente))
                print_r(json_encode($return));
        }else{
            if($return = $this->usuario_model->alterarUsuario($data))
                print_r(json_encode($return));
        }




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


        $this->load->view('usuario/listar', $data);

    }

    public function excluir($idUsuario = null){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);

        if(!is_null($idUsuario) &&  $postdata){

            $idUsuario = $request->idUsuario;

            $this->usuario_model->excluirUsuario($idUsuario);
        }else{
            rdrHome();
        }
    }

    public function editar(){
        if($this->permissoes->usuario->editar){
            $data = array(
                "title"         => "Editar Usuário"
            );

            $this->load->view('usuario/editar', $data);
        }else{
            rdrHome();
        }
    }

    public function infoUsuario($idUsuario = null, $isCliente = false){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        $idUsuario = $request->idUsuario;
        $isCliente = $request->isCliente;

        if($isCliente == 'true'){
            if($return = $this->usuario_model->infoUsuario($idUsuario, true)[0])
                print_r(json_encode($return));
        }else{
            if($return = $this->usuario_model->infoUsuario($idUsuario)[0])
                print_r(json_encode($return));
        }


    }
}