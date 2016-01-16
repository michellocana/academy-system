<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Entradasaida extends CI_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->model('entrada_saida_model');

        if(!checkVisualizar('entrada-saida'))
            redirect(base_url());
    }
    
    public function index(){
        $data = array(
            "title" => "Digite seu nome de usuário para dar entrada",
        );

        $this->session->set_userdata('checkAdmPass', true);

        $this->load->view('entrada-saida/entrada-saida', $data);
    }

    public function checkPasswordMatch(){
        $request = getPost();

        $this->db->select('senha');
        $this->db->where('nickname', $this->session->userdata('nickname'));
        $result = $this->db->get('usuario')->result();
        $result = $result[0]; 

        $return = ($result->senha == md5($request->pass));

        if($return){
            $this->session->unset_userdata('checkAdmPass');
        }

        echo $return;
    }

    public function registrarEntradaSaida(){
        $request = getPost();

        $this->entrada_saida_model->registrarEntradaSaida($request);
    }

    public function teste(){
        $teste = array("mensalidades" => array(0 => array("idMensalidade" => 1, "idUsuario" => 12, "dtMensalidade" => "12/12/1212", "nomeFuncionario" => "Cléber"), 
                                                1 => array("idMensalidade" => 1, "idUsuario" => 12, "dtMensalidade" => "12/12/1212", "nomeFuncionario" => "Krébe")
                                        )
                );

        echo json_encode($teste, JSON_FORCE_OBJECT);
    }
}