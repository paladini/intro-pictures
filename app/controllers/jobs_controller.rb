class JobsController < ApplicationController

	def show()
		@job = Job.find(params[:id])
	end

	def load_vimeo_video()
		id = params[:vimeo_id]
		info = Vimeo::Simple::Video.info(id)
		if (info and info.code == 200)
			render json: {
				"id": info[0]["id"],
				"title": info[0]["title"],
				"description": info[0]["description"],
				"thumbnail_small": info[0]["thumbnail_small"],
				"thumbnail_medium": info[0]["thumbnail_medium"],
				"thumbnail_large": info[0]["thumbnail_large"]
			}
		else
			render json: {}, status: 400
		end

	end
end