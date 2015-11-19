<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login_model extends CI_Model{
	protected $table = 'usuario';

	public function __construct(){
		parent::__construct();
	}

	public function login($nickname, $senha){
		$this->db->where('nickname', $nickname);
    	$this->db->where('senha', $senha);
		$result = $this->db->get($this->table)->result();
		return $result;
	}
	
}