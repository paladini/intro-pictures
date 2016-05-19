class Category < ActiveRecord::Base

	validates :name, presence: true
	has_many :jobs

	def display_name()
		name
	end

	def to_s
		name
	end
	
end
