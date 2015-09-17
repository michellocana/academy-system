$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});

$(document).ready(function(){
	$(".phone-input").mask('(99) 9999.9999?9');
	$(".date-input").mask('99/99/9999');
	$(".cep-input").mask('99999-999');
	$(".cpf-input").mask('999.999.999-99');
	$(".cnpj-input").mask('99.999.999/9999-99');    
});
