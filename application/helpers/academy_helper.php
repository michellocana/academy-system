<?php  
if(!function_exists('strip_quotation_marks')){
	function strip_quotation_marks($string){
		$string = str_replace("\"", "", $string);
		$string = str_replace("'", "", $string);

		return $string;
	}
}