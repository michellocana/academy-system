<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Login_model extends CI_Model{
	protected $table = 'usuario';

	public function __construct(){
		parent::__construct();
	}

	public function login($dsNickname, $dsPassword){
		$this->db->where('dsNickname', $dsNickname);
    	$this->db->where('dsPassword', $dsPassword);
		$result = $this->db->get($this->table)->result();
		return $result;
	}
	
}