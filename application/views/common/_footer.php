	<script src="<?php echo base_url('assets/js/jquery.min.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/angular.min.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/jquery.helpers.min.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/global.js'); ?>"></script>
	<script src='<?php echo base_url('assets/js/material.min.js'); ?>'></script>
	<script src='<?php echo base_url('assets/js/ui-mask.js'); ?>'></script>
	<script src='<?php //echo base_url('assets/js/alertify.js'); ?>'></script>
	<script src='<?php echo base_url('assets/js/ng-alertify.js'); ?>'></script>
	<?php if($this->uri->segment(1) == 'usuario'): ?>
	<script src="<?php echo base_url('assets/js/usuario.js'); ?>"></script>
	<?php endif; ?>
	<?php if($this->uri->segment(1) == 'cliente'): ?>
	<script src="<?php echo base_url('assets/js/cliente.js'); ?>"></script>
	<?php endif; ?>
</html>