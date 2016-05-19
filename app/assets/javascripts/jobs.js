var myOwnDelay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

var setModalHeight = function() {
	if (($('.modal-body').length > 0) && !($('.modal-body').hasClass('locked-body'))) {
		if ($(window).width() >= 992) {
			var vimeoHeight = $('.video').last().height().toString() + "px !important";
			$('.col-video-description').last().attr("style", 'height:' + vimeoHeight);
		}
	}
}

var parseModal = function() {

	$('.job-outer').on('click', function(e){
		$('#myModal').modal('show');
		myOwnDelay(function(){
			setModalHeight();
	    }, 350);
	});

	$("#myModal").on('hidden.bs.modal', function (e) {
	    $("#myModal iframe").attr("src", $("#myModal iframe").attr("src"));
	});

	// Modal responsiveness
	$(window).resize(function() {
	    myOwnDelay(function(){
			setModalHeight();
	    }, 350);
	});

}
$(document).ready(parseModal);
$(document).on('page:load', parseModal);