<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('login_model');
    }
    
    public function index(){
		$data = array(
    		'title' => 'Login'
    	);

        $this->load->view('login', $data);
    }

    public function login(){
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);

        $dsNickname = $request->dsNickname;
        $dsPassword = md5($request->dsPassword);

        $result = $this->login_model->login($dsNickname, $dsPassword);

        if(sizeof($result) > 0){
            $this->session->set_userdata('logged', true);
            $this->session->set_userdata('dsNickname', $dsNickname);
            $this->session->set_userdata('dsNome', $result[0]->dsNome);
            $this->session->set_userdata('dsSobrenome', $result[0]->dsSobrenome);

            $returnData['status'] = 'success';
            $returnData['message'] = 'Login efetuado com successo.';
            print_r(json_encode($returnData));            
        }else{
            $returnData['status'] = 'error';
            $returnData['message'] = 'Login ou senha incorretos.';
            print_r(json_encode($returnData));            
        }
    }

    public function logout(){
        $this->session->sess_destroy();
        redirect(base_url('login'));
    }
}