class Employee < ActiveRecord::Base

# Fields / Columns:
# 	t.string :name
# 	t.string :role_pt
# 	t.string :role_en
# 	t.string :role_es

	belongs_to :company

	# Validations
	validates :name, presence: true
	validates :role_pt, presence: true
	validates :role_en, presence: true
	validates :role_es, presence: true

end
