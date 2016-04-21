class Job < ActiveRecord::Base

# Fields / Columns:
#   t.string :url #can be a video or an album
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

	validates :url, presence: true

	# Validating Vimeo video or album
	validates :url, format: { with: /(http|https):\/\/(www.|)vimeo.com\/[[0-9]*|album\/[0-9]*]+/ix }

end
