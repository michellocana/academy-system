	<script src="<?php echo base_url('assets/js/jquery.min.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/angular.min.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/academy.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/jquery.helpers.min.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/bootstrap.min.js'); ?>"></script>
	<script src="<?php echo base_url('assets/js/global.js'); ?>"></script>
	<?php if($this->uri->segment(1) == 'usuario'): ?>
	<script src="<?php echo base_url('assets/js/usuario.js'); ?>"></script>
	<?php endif; ?>
</html>