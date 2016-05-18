class Message
	include ActiveModel::Model
	include ActiveModel::Conversion
	include ActiveModel::Validations
	attr_accessor :name, :email, :subject, :content, :department, :file

	validates :name, presence: true
	validates :email, presence: true, format: { with: /\S+@\S+\.\S+/ix }
	validates :subject, presence: true
	validates :content, presence: true
	validates :department, presence: true
	validate :file_size_validation

private
	def file_size_validation
    	errors[:file] << "Should be less than 5MB" if file.size > 5.megabytes
  	end
end
