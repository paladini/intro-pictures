class JobsController < ApplicationController

	def show()
		job = Job.find(params[:id])

		# Check if there's a password for the given job. 
		# If so, checks if the user has provided password equal to the correct password.
		if (job.password.blank? or (params[:password] and job.password == params[:password]))
			@job = job

			respond_to do |format|
			    format.html do
			    	redirect_to root_path
			    end
			    format.js do
			    	render 'show'
			    end
		    end
		else
			redirect_to controller: "jobs", action: "locked", id: params[:id]
		end

	end

	def locked()
		job = Job.find(params[:id])
		@id = job.id
		@year = job.year
		if I18n.locale == :en
			@title = job.title_en
		elsif I18n.locale == :pt
			@title = job.title_pt
		elsif I18n.locale == :es
			@title = job.title_es
		end

		respond_to do |format|
		    format.html do
		    	redirect_to root_path
		    end
		    format.js do
		    	render 'locked'
		    end
	    end
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
				"thumbnail_large": info[0]["thumbnail_large"],
				"duration": info[0]["duration"]
			}
		else
			render json: {}, status: 400
		end

	end
end