class Message
	include ActiveModel::Model
	include ActiveModel::Conversion
	include ActiveModel::Validations
	attr_accessor :name, :email, :subject, :content, :department, :file

	validates :name, presence: true
	validates :email, presence: true
	validates :subject, presence: true
	validates :content, presence: true
	validates :department, presence: true
	# validate :testing, on: [:new]

private
	# def testing()
	# 	puts "OLAARRR MUNDOOOOOOOOOOOOOOO"
	# end

end
