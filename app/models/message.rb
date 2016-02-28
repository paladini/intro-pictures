class Message
	include ActiveModel::Model
	attr_accessor :name, :email, :subject, :content, :department, :file

	validates :name, :email, :subject, :content, :department, presence: true

end
