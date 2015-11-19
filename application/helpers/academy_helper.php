<?php  

if(!function_exists('strip_quotation_marks')){
	function strip_quotation_marks($string){
		$string = str_replace("\"", "", $string);
		$string = str_replace("'", "", $string);

		return $string;
	}
}

if(!function_exists('isCliente')){
	function isCliente($idUsuario){
		$ci =& get_instance();
		$ci->db->select('snTipo');
		$ci->db->where('idUsuario', $idUsuario);
		$result = $ci->db->get('usuario')->result();
		$result = strip_quotation_marks($result[0]->snTipo);

		return ($result == 'CLI') ? true : false;
	}
}