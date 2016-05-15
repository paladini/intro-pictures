class Company < ActiveRecord::Base

# Fields / Columns:
# 	  t.text :summary_pt
#     t.text :summary_en
#     t.text :summary_es
#     t.text :address_pt
#     t.text :address_en
#     t.text :address_es
#     t.text :email
#     t.text :telephone
# 	  t.string :contact_email

	has_many :employees
	has_many :departments
	accepts_nested_attributes_for :departments

	# Validations
	validates :summary_pt, presence: true
	validates :summary_en, presence: true
	validates :summary_es, presence: true
	validates :address_pt, presence: true
	validates :address_en, presence: true
	validates :address_es, presence: true
	validates :email, presence: true
	validates :telephone, presence: true
	before_validation :validate_single_company, on: :create

private
	# Certifies that only a single company exists in the database.
	def validate_single_company()
		if Company.count > 0
			errors.add(:email, "Apenas uma empresa pode existir no banco de dados - e ela já existe! Por favor, contacte o administrador.")
		end
	end

end
