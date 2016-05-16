var parseModal = function() {

	$('.job-outer').on('click', function(e){
		$('#myModal').modal('show');
	});

	$("#myModal").on('hidden.bs.modal', function (e) {
	    $("#myModal iframe").attr("src", $("#myModal iframe").attr("src"));
	});

}
$(document).ready(parseModal);
$(document).on('page:load', parseModal);