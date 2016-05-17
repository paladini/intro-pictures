class JobsController < ApplicationController

	def show()
		job = Job.find(params[:id])

		# Public job (no password) or correct password
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

		# Wrong password
		elsif (job.password.present? and params[:password] and (job.password != params[:password]))
			respond_to do |format|
			    format.html { redirect_to root_path }
			    format.js do
			    	flash.now[:wrong_password] = true
			    end
		    end
		else
			redirect_to controller: "jobs", action: "locked", id: params[:id], locale: I18n.locale
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

		# [Vimeo] API keys
		ck = "498c9e3b2e449282fc3bc60f00b708e375fdcd31" #consumer key
		cs = "k4pk3U9vsrJH+0FCD4F9JczOVnTyAFDDMZjr0lYzFreHRGqpzAyOc+nKLWhY+yY6aplzx1f7NkMeLIPuEnMcmFzIv7RBs1TZCZQFyOBBeF36yEnK5gRnfno8wP+XVSXF" #consumer secret
		# [Vimeo] Account token and secret
		tk = "1a94b43e39b86265129d1a07d530a096" # token
		#sc =  # secret
		video = Vimeo::Advanced::Video.new(ck, cs, token: tk, secret: sc)
		video.get_all("matthooks")
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