

var ready = function() {

	// $('.modal-clickable').on('click', function(){
	//     $(this).modal();
	// })

	/*
		=====================
	 		 Search bar
		=====================
	*/
	function search_do() {
		var input_text = $('#search').val();
		if (input_text.length === 0) {
			$('.job').show();
		} else {
			var jobs = $('#jobs').find('.job');
			for(var i = 0; i < jobs.length; i++) {
				var current = $(jobs[i]);
				var text_of_current = $(current.find('.job-title')).text().toLowerCase();
				if (text_of_current.indexOf(input_text.toLowerCase()) > -1) {
					current.show();
				} else {
					current.hide();
				}
			}
		}
	}

	// On click
	$('#search-icon').click(function(e){
		search_do();
	});

	// On enter pressed
	$('#search').keypress(function(e){
  		if (e.which == 13) {
    		search_do();
    		return false;    //<---- Add this line
  		}
    });

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
};

// Compatibility reasons
$(document).ready(ready);
$(document).on('page:load', ready);
// $(document).on('turbolinks:load', ready);