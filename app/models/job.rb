class Job < ActiveRecord::Base

	belongs_to :category

	validates :video_url, presence: true
	validates :video_id, presence: true
	validates :video_thumb_small, presence: true
	validates :video_thumb_medium, presence: true
	validates :video_thumb_large, presence: true
	validate :id_uniqueness_validation, on: [:create]

	# Validating Vimeo video or album
	validates :video_url, format: { with: /https?:\/\/(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/([^\/]*)\/videos\/|album\/(\d+)\/video\/|video\/|)(\d+)(?:$|\/|\?)/ix }
	
	#
	# 	Title
	#
	# Try to always shows a title. 
	def title?()
		return (title() != nil)
	end

	def title()
		if I18n.locale == :en
			if title_en.present?
				return title_en
			elsif title_pt.present?
				return title_pt
			elsif title_es.present?
				return title_es
			end
		elsif I18n.locale == :pt
			if title_pt.present?
				return title_pt
			elsif title_en.present?
				return title_en
			elsif title_es.present?
				return title_es
			end
		elsif I18n.locale == :es
			if title_es.present?
				return title_es
			elsif title_en.present?
				return title_en
			elsif title_pt.present?
				return title_pt
			end
		end
	end

	#
	# 	Synopsis
	#
	def synopsis?()
		return (synopsis() != nil)
	end

	def synopsis()
		if I18n.locale == :en and synopsis_en.present?
			return synopsis_en
		elsif I18n.locale == :pt and synopsis_pt.present?
			return synopsis_pt
		elsif I18n.locale == :es and synopsis_es.present?
			return synopsis_es
		end
	end

	#
	# 	Format
	#
	def format?()
		return (format() != nil)
	end

	def format()
		if I18n.locale == :en and format_en.present?
			return format_en
		elsif I18n.locale == :pt and format_pt.present?
			return format_pt
		elsif I18n.locale == :es and format_es.present?
			return format_es
		end
	end

	#
	# 	Genre
	#
	def genre?()
		return (genre() != nil)
	end

	def genre()
		if I18n.locale == :en and genre_en.present?
			return genre_en
		elsif I18n.locale == :pt and genre_pt.present?
			return genre_pt
		elsif I18n.locale == :es and genre_es.present?
			return genre_es
		end
	end

	#
	# 	Subgenre
	#
	def subgenre?()
		return (subgenre() != nil)
	end

	def subgenre()
		if I18n.locale == :en and subgenre_en.present?
			return subgenre_en
		elsif I18n.locale == :pt and subgenre_pt.present?
			return subgenre_pt
		elsif I18n.locale == :es and subgenre_es.present?
			return subgenre_es
		end
	end

	#
	# 	Running Time
	#
	def running_time?()
		return (running_time() != nil)
	end

	def running_time()
		if I18n.locale == :en and running_time_en.present?
			return running_time_en
		elsif I18n.locale == :pt and running_time_pt.present?
			return running_time_pt
		elsif I18n.locale == :es and running_time_es.present?
			return running_time_es
		end
	end

	#
	# 	Target
	#
	def target?()
		return (target() != nil)
	end

	def target()
		if I18n.locale == :en and target_en.present?
			return target_en
		elsif I18n.locale == :pt and target_pt.present?
			return target_pt
		elsif I18n.locale == :es and target_es.present?
			return target_es
		end
	end

	#
	# 	Created By
	#
	def created_by?()
		return (created_by() != nil)
	end

	def created_by()
		if I18n.locale == :en and created_by_en.present?
			return created_by_en
		elsif I18n.locale == :pt and created_by_pt.present?
			return created_by_pt
		elsif I18n.locale == :es and created_by_es.present?
			return created_by_es
		end
	end

	#
	# 	Written By
	#
	def written_by?()
		return (written_by() != nil)
	end

	def written_by()
		if I18n.locale == :en and written_by_en.present?
			return written_by_en
		elsif I18n.locale == :pt and written_by_pt.present?
			return written_by_pt
		elsif I18n.locale == :es and written_by_es.present?
			return written_by_es
		end
	end

	#
	# 	Directed By
	#
	def directed_by?()
		return (directed_by() != nil)
	end

	def directed_by()
		if I18n.locale == :en and directed_by_en.present?
			return directed_by_en
		elsif I18n.locale == :pt and directed_by_pt.present?
			return directed_by_pt
		elsif I18n.locale == :es and directed_by_es.present?
			return directed_by_es
		end
	end

	#
	# 	Status
	#
	def status?()
		return (status() != nil)
	end

	def status()
		if I18n.locale == :en and status_en.present?
			return status_en
		elsif I18n.locale == :pt and status_pt.present?
			return status_pt
		elsif I18n.locale == :es and status_es.present?
			return status_es
		end
	end

	private
		def id_uniqueness_validation()
			if Job.where(video_id: self.video_id).any?
				errors.add(:video_url, "Este vídeo já foi adicionado!")
			end
		end

end

# Fields / Columns:
#   t.string :title_pt
#   t.string :title_en 
#   t.string :title_es 
#   t.string :password  (if blank, it's public)
#   t.text :synopsis_pt
#   t.text :format_pt
#   t.text :genre_pt
#   t.text :subgenre_pt
#   t.text :running_time_pt 
#   t.text :target_pt
#   t.text :created_by_pt 
#   t.text :written_by_pt
#   t.text :directed_by_pt
# 	t.text :synopsis_es
#   t.text :synopsis_en
#   t.text :format_es
#   t.text :format_en
#   t.text :genre_es
#   t.text :genre_en
#   t.text :subgenre_es
#   t.text :subgenre_en
#   t.text :running_time_es
#   t.text :running_time_en
#   t.text :target_es
#   t.text :target_en
#   t.text :created_by_es
#   t.text :created_by_en
#   t.text :written_by_es
#   t.text :written_by_en
#   t.text :directed_by_es
#   t.text :directed_by_en
#   t.text :status 
#   t.text :player 