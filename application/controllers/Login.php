<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }
    
    public function index(){
		$data = array(
    		'title' => 'Login'
    	);

        $this->load->view('login', $data);
    }

    public function login(){
        $dsNickname = $this->input->post('dsNickname');
        $dsPassword = md5($this->input->post('dsPassword'));

        $this->db->where('dsNickname', $dsNickname);
        $this->db->where('dsPassword', $dsPassword);

        $result = $this->db->get('usuario')->result();

        if(sizeof($result) > 0){
            $this->session->set_userdata('logged', true);
            $this->session->set_userdata('dsNickname', $dsNickname);
            $this->session->set_userdata('dsNome', $result[0]->dsNome);
            $this->session->set_userdata('dsSobrenome', $result[0]->dsSobrenome);
            redirect(base_url('home'));
        }else{
            echo 'meça seus logins, parça';
        }
    }

    public function logout(){
        $this->session->sess_destroy();
        redirect(base_url('login'));
    }
}