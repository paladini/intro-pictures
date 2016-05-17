class Job < ActiveRecord::Base

	validates :video_url, presence: true
	validates :video_id, presence: true
	validates :video_thumb_small, presence: true
	validates :video_thumb_medium, presence: true
	validates :video_thumb_large, presence: true
	validate :id_uniqueness_validation, on: [:create]

	# Validating Vimeo video or album
	# validates :video_url, format: { with: /(http|https):\/\/(www.|)vimeo.com\/[[0-9]*|album\/[0-9]*]+/ix }
	validates :video_url, format: { with: /https?:\/\/(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/([^\/]*)\/videos\/|album\/(\d+)\/video\/|video\/|)(\d+)(?:$|\/|\?)/ix }
	
	def title?()
		return (title() != nil)
	end

	def title()
		if I18n.locale == :en and title_en.present?
			return title_en
		elsif I18n.locale == :pt and title_pt.present?
			return title_pt
		elsif I18n.locale == :es and title_es.present?
			return title_es
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