$(document).ready(function() {

	// Removing old errors
	function hide_error(e) {
		$('#job_video_url').parent().find('.inline-errors').remove();
	}

	// Showing new errors
	function show_error(e) {
		$('#job_video_url').parent().append("<p class=\"inline-errors\">Algo de errado aconteceu, não foi possível identificar um vídeo do Vimeo.</p>");
	}

	function load_video(e) {
		var val = $('#job_video_url').val();
		if (val.length == 0) {
			var parent = $('#input_thumbnail').parent();
			parent.find('img').remove();
			parent.find('p').show();
			return;
		}
		var id = val.match(/https?:\/\/(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/([^\/]*)\/videos\/|album\/(\d+)\/video\/|video\/|)(\d+)(?:$|\/|\?)/)
		
		if (id && parseInt(id[id.length-1])) {
			id = parseInt(id.pop());
			$.post("/load_video", {vimeo_id:id}).done(function(data){
				hide_error();
				var parent = $('#input_thumbnail').parent();
				parent.find('p').hide();
				parent.find('img').remove();
				parent.append('<img src="' + data['thumbnail_large'] + '" alt="A imagem é obtida automaticamente a partir da miniatura cadastrada no Vimeo." title="A imagem é obtida automaticamente a partir da miniatura cadastrada no Vimeo." />');
				
				// Setting hidden inputs
				$('#job_video_id').val(data["id"]);
				$('#job_video_thumb_small').val(data["thumbnail_small"]);
				$('#job_video_thumb_medium').val(data["thumbnail_medium"]);
				$('#job_video_thumb_large').val(data["thumbnail_large"]);

				// Setting inputs (if no content was inserted)
				if ($('#job_title_en').val().length == 0) {
					$('#job_title_en').val(data["title"]);
				}
				if ($('#job_synopsis_en').val().length == 0) {
					$('#job_synopsis_en').val(data["description"]);
				}
			}).error(function(error){
				hide_error(error);
				show_error(error);
			});
		} else {
			hide_error();
			show_error();
		}
	}

	// Detecting focus out from video input
	$('#job_video_url').on('focusout', load_video);
});