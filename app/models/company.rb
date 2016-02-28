class Company < ActiveRecord::Base

# Fields / Columns:
# 	  t.text :summary_pt
#     t.text :summary_en
#     t.text :summary_es
#     t.text :address_pt
#     t.text :address_en
#     t.text :address_es
#     t.string :email
#     t.string :telephone

	has_many :employees

	# Validations
	validates :summary_pt, presence: true
	validates :summary_en, presence: true
	validates :summary_es, presence: true
	validates :address_pt, presence: true
	validates :address_en, presence: true
	validates :address_es, presence: true
	validates :email, presence: true
	validates :telephone, presence: true

end
