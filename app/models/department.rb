class Department < ActiveRecord::Base

	belongs_to :company
	
	validates :email, presence: true
	validates :email, email_format: { message: "Por favor, use um endereço de e-mail válido." }, presence: true
	validates :name_pt, presence: true, uniqueness: true
	validates :name_es, presence: true, uniqueness: true
	validates :name_en, presence: true, uniqueness: true

end
