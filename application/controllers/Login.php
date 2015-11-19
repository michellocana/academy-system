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

        $nickname = $request->nickname;
        $senha = md5($request->senha);

        $result = $this->login_model->login($nickname, $senha);

        if(sizeof($result) > 0){
            $this->session->set_userdata('logged', true);
            $this->session->set_userdata('nickname', $nickname);
            $this->session->set_userdata('nome', $result[0]->nome);
            $this->session->set_userdata('sobrenome', $result[0]->sobrenome);

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