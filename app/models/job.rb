class Job < ActiveRecord::Base

# Fields / Columns:
#   t.string :url #can be a video or an album
#   t.string :title_pt
#   t.string :title_en 
#   t.string :title_es 
#   t.string :password  (if blank, it's public)
#   t.text :synopsis
#   t.text :format
#   t.text :genre 
#   t.text :subgenre 
#   t.text :running_time 
#   t.text :target 
#   t.text :created_by 
#   t.text :written_by 
#   t.text :directed_by 
#   t.text :status 
#   t.text :player 

	validates :url, presence: true

	# Validating Vimeo video or album
	validates :url, format: { with: /(http|https):\/\/(www.|)vimeo.com\/[[0-9]*|album\/[0-9]*]+/ix }
	# has_vimeo_video :url
	# Create validation for a Vimeo video later.
	# validates :url, format: { with: URI.regexp }, if: Proc.new { |a| a.url.present? }

end
