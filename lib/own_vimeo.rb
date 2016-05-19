module OwnVimeo

	require 'http'
	require 'json'
	require 'date'
	
	def get_vimeo_video(video_id)

		# Make sures that a video_id exists
		if video_id.blank?
			return nil
		end

		# Make the request to Vimeo
		video = HTTP.auth("Bearer 1a94b43e39b86265129d1a07d530a096").get('https://api.vimeo.com/videos/' + video_id.to_s)
		
		# Check the status of the request
		if video.code == 200

			# Parse the JSON
			v = JSON.parse(video.to_s)
			return {
				title: v['name'],
				description: v['description'],
				thumbnail_small: v['pictures']['sizes'][-3]['link'],
				thumbnail_medium: v['pictures']['sizes'][-2]['link'],
				thumbnail_large: v['pictures']['sizes'][-1]['link'],
				duration: v['duration'],
				year: Date.parse(v['created_time']).year
			}
		else
			return nil
		end
	end
end
