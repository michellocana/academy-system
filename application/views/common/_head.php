<html lang="pt-br" ng-app='academyApp'>
<head>
	<title><?php echo (isset($title)) ? $title : 'Academy System - ' . ucfirst($this->uri->segment(1)); ?></title>
	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/bootstrap.css') ?>" />
	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/academy.css') ?>" />
	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/medias.css') ?>" />
</head>
