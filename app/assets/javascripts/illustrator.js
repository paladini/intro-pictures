$(document).ready(function(){

	/*
		=====================
	 		 Anchor links
		=====================
	*/

	// On page load.
	var hash = window.location.hash.substring(1);
	if (hash == 'header') {
		$('.anchor-nav-item-active').removeClass('anchor-nav-item-active');
		$('#header-nav').addClass('anchor-nav-item-active');
	} else if (hash === 'informations') {
		$('.anchor-nav-item-active').removeClass('anchor-nav-item-active');
		$('#informations-nav').addClass('anchor-nav-item-active');
	} else if (hash == 'contact') {
		$('.anchor-nav-item-active').removeClass('anchor-nav-item-active');
		$('#contact-nav').addClass('anchor-nav-item-active');
	}

	// On page scroll.
	$(document).scroll(function () {
		var currentHash = window.location.hash.substring(1);
        $('.anchor, .anchor-header').each(function () {
            var top = window.pageYOffset;
            var distance = top - $(this).offset().top;
            var hash = $(this).attr('id') || $(this).attr('data-id');

            if (distance < 30 && distance > -30) {
            	$('.anchor-nav-item-active').removeClass('anchor-nav-item-active');
				$('#' + hash + '-nav').addClass('anchor-nav-item-active');
            }
        });
    });

	// On click
	$('.anchor-nav-item').on('click', function(event){
		$('.anchor-nav-item-active').removeClass('anchor-nav-item-active');
		$(this).addClass('anchor-nav-item-active');
	});
});