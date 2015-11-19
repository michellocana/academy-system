$("#menu-toggle").click(function(e) {
	e.preventDefault();
	$("#wrapper").toggleClass("toggled");
});

$('input[type=file]').change(function(event){
	var fileName = (event.target.files[0].name);

	$(event.target).parent().children('label').text(fileName);
});

// Fixing "is-dirty" class bug from MDL when value is set dinamycally
updateFields = function(){
	$('input, textarea').each(function(){
		if($(this).val != ''){
			$(this).parent('div.mdl-textfield').addClass('is-dirty');
		}
	});
};

$(function(){
	updateFields();
});