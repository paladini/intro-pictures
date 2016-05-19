$(document).ready(function() {

	// Removing old errors
	function hide_error(e) {
		$('#job_video_url').parent().find('.inline-errors').remove();
	}

	// Showing new errors
	function show_error(e) {
		$('#job_video_url').parent().append("<p class=\"inline-errors\">Algo de errado aconteceu, não foi possível identificar um vídeo do Vimeo.</p>");
	}

	function insert_video(imgUrl) {
		hide_error();
		var parent = $('#input_thumbnail').parent();
		parent.find('img').remove();
		parent.append('<img src="' + imgUrl + '" style="width: auto; height: 300px;" alt="A imagem é obtida automaticamente a partir da miniatura cadastrada no Vimeo e está sendo exibida aqui de forma redimensionada." title="A imagem é obtida automaticamente a partir da miniatura cadastrada no Vimeo e está sendo exibida aqui de forma redimensionada." />');
	}

	function load_video() {
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
				
				// Inserting new image in the page
				insert_video(data["thumbnail_large"]);

				// Setting hidden inputs
				$('#job_video_id').val(data["id"]);
				$('#job_video_thumb_small').val(data["thumbnail_small"]);
				$('#job_video_thumb_medium').val(data["thumbnail_medium"]);
				$('#job_video_thumb_large').val(data["thumbnail_large"]);

				// Setting inputs (if no content was inserted)
				if ($('#job_title_en').val().length == 0) {
					$('#job_title_en').val(data["title"]);
				}
				if ($('#job_title_pt').val().length == 0) {
					$('#job_title_pt').val(data["title"]);
				}
				if ($('#job_title_es').val().length == 0) {
					$('#job_title_es').val(data["title"]);
				}
				if ($('#job_synopsis_en').val().length == 0) {
					$('#job_synopsis_en').val(data["description"]);
				}
				if ($('#job_synopsis_pt').val().length == 0) {
					$('#job_synopsis_pt').val(data["description"]);
				}
				if ($('#job_synopsis_es').val().length == 0) {
					$('#job_synopsis_es').val(data["description"]);
				}
				if ($('#job_running_time_en').val().length == 0) {
					$('#job_running_time_en, #job_running_time_es, #job_running_time_pt').val((Math.round(data["duration"] / 60)).toString() + " min");
				}
				if ($('#job_year').val().length == 0) {
					$('#job_year').val(data["year"]);
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

	// Detecting the click on the button
	$('#update_thumb').on('click', load_video);

	// Detects if the thumbnail already exists (on edit form)
	var thumbnail = $('#job_video_thumb_large').val();
	if (thumbnail && thumbnail.length > 0) {
		insert_video(thumbnail);
		return;
	}
});