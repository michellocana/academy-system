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

$('input[type=file]').change(function(event){
	var fileName = (event.target.files[0].name);

	$(event.target).parent().children('label').text(fileName);
});

$('input[type=password]').on('propertychange change click keyup input paste', function(event){
	var label = $($(event.target).parent().children('label'));
	
	if(event.target.value.length >= 1){
		label.css({
			fontSize: 0
		});
	}else{
		label.css({
			fontSize: 'initial'
		});
	}
});
