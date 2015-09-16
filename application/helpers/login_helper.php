<?php  
	$ci =& get_instance();
	$ci->load->library('session');
	$session = $ci->session->all_userdata();

	if(!in_array('logged', $session) and $ci->uri->segment(1) != 'login')
		redirect(base_url('login'));