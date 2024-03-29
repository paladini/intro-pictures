function validateEmail(email) 
{
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}

/*
	===========================
 		 Form validations
	===========================
*/
function formValidations() {

	$('#new_message').find('input[type="text"], select, input[type="email"], textarea, input[type="file"]').one('blur keydown', function(e){
		$(this).addClass('touched');
	});

	$('#message_email').on('keydown', function() {
		if ($(this).hasClass('touched')) {
			if (validateEmail($(this).val())) {
				$(this)[0].setCustomValidity('');
			} else {
				$(this)[0].setCustomValidity('Please fill out this field.');
			}
		}
	});

	// When click on input[type='file']
	$('#message_file:file').change(function(){
		var fileName = $(this).val();
		
		if (fileName) {
			$('.custom-file-upload span').text(fileName);
			$('.custom-file-upload').addClass('custom-file-upload-green');
		} else {
			$('.custom-file-upload span').text($('.custom-file-upload').data('label'));
		}
	});

	// Checking which inputs already have a selected value.
	$('#new_message').find('input[type="text"], select, input[type="email"], textarea, input[type="file"]').each(function(){
		if ($(this).val().length > 0) {
			$(this).addClass('touched');
		}
	});
}

var ready = function() {

	formValidations();

	/*
		=====================
	 		 Search bar
		=====================
	*/
	function search_do() {
		var input_text = $('#search').val();
		if (input_text.length === 0) {
			$('#no-result').hide();
			$('.job').show();
		} else {
			var jobs = $('#jobs').find('.job');
			var hidden = 0;
			for(var i = 0; i < jobs.length; i++) {
				var current = $(jobs[i]);
				var text_of_current = $(current.find('.job-title')).text().toLowerCase();
				if (text_of_current.indexOf(input_text.toLowerCase()) > -1) {
					current.show();
				} else {
					current.hide();
				}
				// If not visible, add 1 to "hidden"
				hidden += !(current.is(':visible')); 
			}
			
			if (hidden == jobs.length) {
				$('#no-result').show();
			} else {
				$('#no-result').hide();
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

	// Smooth scroll;
	$('#anchor-nav a, #logo').smoothScroll();

};

// Compatibility reasons
$(document).ready(ready);
$(document).on('page:load', ready);
// $(document).on('turbolinks:load', ready);