<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Entradasaida extends CI_Controller {

    public function __construct() {
        parent::__construct();

        if(!checkVisualizar('entrada-saida'))
            redirect(base_url());
    }
    
    public function index(){
        $data = array(
            "title" => "Digite seu nome de usuário para dar entrada",
        );

        $this->load->view('entrada-saida/entrada-saida', $data);
    }
}