var parseModal = function() {

	$('.job-outer').on('click', function(e){
		$('#myModal').modal('show');
	});

	$("#myModal").on('hidden.bs.modal', function (e) {
	    $("#myModal iframe").attr("src", $("#myModal iframe").attr("src"));
	});

	// For locked content
	// $('#unlock_password_button').on('click', function(e){
	// 	console.log($('#unlock_password_text').val());
	// });

}
$(document).ready(parseModal);
$(document).on('page:load', parseModal);