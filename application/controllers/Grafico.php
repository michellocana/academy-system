<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Grafico extends CI_Controller {

    public function __construct() {
        parent::__construct();

        if(!checkVisualizar('grafico'))
            redirect(base_url());
    }
    
    public function index(){
		$data = array(
			"title" => "Gráficos"
		);

		$this->load->view('grafico/grafico', $data);
    }


}