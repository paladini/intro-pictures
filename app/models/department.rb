class Department < ActiveRecord::Base

	belongs_to :company
	
	validates :email, presence: true
	validates :email, email_format: { message: "Por favor, use um endereço de e-mail válido." }, presence: true
	# belongs_to :contact

end
