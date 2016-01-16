<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Entrada_saida_model extends CI_Model{
	protected $table = 'entrada_saida';

	public function __construct(){
		parent::__construct();
	}

	public function registrarEntradaSaida($data){
		$query = 'SELECT idUsuario 
				  FROM {PRE}usuario 
				  WHERE senha = "' . md5($data->pass) . '"
				  AND snTipo = \'CLI\' 
				  AND nickname = "' . $data->user . '"
				  OR email = "' . $data->user . '"';

		$idUsuario = $this->db->query($query)->result();

		if(!empty($idUsuario)){
			$idUsuario = $idUsuario[0]->idUsuario;

			$query = 'SELECT idEntradaSaida
					  FROM {PRE}entrada_saida
					  WHERE idUsuario = ' . $idUsuario . '
					  AND horaSaida = \'00:00:00\'';

			$campoHora = $this->db->query($query)->result();

			$campoHoraEntradaSaida = ($campoHora) ? 'horaSaida' : 'horaEntrada';

			if($campoHora){
				$data = array(
					'horaSaida' 	=> date('H:i:s'),
					'data' 			=> date('Y:M-D'),
				);
				$idEntradaSaida = $campoHora[0];
				$idEntradaSaida = $idEntradaSaida->idEntradaSaida;

				$this->db->where('idUsuario', $idUsuario);
				$this->db->where('idEntradaSaida', $idEntradaSaida);
				$this->db->update('entrada_saida', $data);

				$dataReturn = array(
					'entradaSaida' 	=> 'SAIDA',
					'hora'			=> date('H:i:s'),
				);
			}else{
				$data = array(
					'horaEntrada' 	=> date('H:i:s'),
					'data' 			=> date('Y-M-D'),
					'idUsuario'		=> $idUsuario
				);

				$this->db->insert('entrada_saida', $data);

				$dataReturn = array(
					'entradaSaida' 	=> 'ENTRADA',
					'hora'			=> date('H:i:s'),
				);
			}

			echo json_encode($dataReturn);

		}else{
			return false;
		}

	}
}