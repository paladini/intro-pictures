class JobsController < ApplicationController
	include OwnVimeo

	def show()
		job = Job.find(params[:id])

		# Public job (no password) or correct password
		if (job.password.blank? or (params[:password] and job.password == params[:password]))
			@job = job

			if job.password.present?
				flash.now[:correct_password] = true
			end

			respond_to do |format|
			    format.html { redirect_to root_path }
			    format.js { render 'show' }
		    end

		# Wrong password
		elsif (job.password.present? and params[:password] and (job.password != params[:password]))
			respond_to do |format|
			    format.html { redirect_to root_path }
			    format.js { flash.now[:wrong_password] = true }
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
		    format.html { redirect_to root_path }
		    format.js { render 'locked' }
	    end
	end

	def load_vimeo_video()

		info = get_vimeo_video(params[:vimeo_id])

		if (info)
			render json: {
				"id": params[:vimeo_id],
				"title": info[:title],
				"description": info[:description],
				"thumbnail_small": info[:thumbnail_small],
				"thumbnail_medium": info[:thumbnail_medium],
				"thumbnail_large": info[:thumbnail_large],
				"duration": info[:duration],
				"year": info[:year]
			}
		else
			render json: {}, status: 400
		end

	end
end