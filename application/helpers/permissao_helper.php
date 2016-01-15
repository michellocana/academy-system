<?php 
	$ci =& get_instance();
	$ci->load->library('session');
	$session = $ci->session->all_userdata();

	if(isset($session['nickname'])){
		$nickname = $session['nickname'];
		$ci->db->select('snTipo');
		$ci->db->where('nickname', $nickname);
		$snTipo = $ci->db->get('usuario')->result();
		$snTipo = $snTipo[0]->snTipo;

		$ci->load->model('configuracoes_model');
		$perm = $ci->configuracoes_model->getPermissoes($snTipo);
		$entidades = $ci->configuracoes_model->getEntidades();

		$ci->permissoes = new stdClass();

		foreach ($entidades as $ent) {
			$ent = $ent->entidade;

			$ci->permissoes->$ent = new stdClass();
		}

		foreach ($perm as $p) {
			$p->acesso = ($p->acesso == 'S') ? true : false;

			$entidade = $p->entidade;
			$acao = strtolower($p->acao);
			$ci->permissoes->$entidade->$acao = $p->acesso;
		}
	}

	if(!function_exists('checkVisualizar')){
		function checkVisualizar($entidade){
			$ci =& get_instance();
			return $ci->permissoes->$entidade->visualizar;			
		}
	}