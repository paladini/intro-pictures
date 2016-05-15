# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seeds_production()
	puts "Running seeds for production..."
end

def seeds_development()
	puts "Running seeds for development..."

	# Creating admin
	AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

	# Creating company basic info.
	sm_pt = "Minha descrição favorita."
	sm_en = "The richness of brazilian folklore and of traditions and festivities from this theme is widely known. However, do you know the great variety of events annualy held, far from big centers and big audience, but even so very essential?
		It aims at showing distinctive and tradional cultural aspects of brazil from its public gathering, in addition to showing different regions of the country, which is so rich in contrasts and different landscapes."
	sm_es = "Mi descripción favorita."
	ad_pt = "Rua Peixoto Gomide 1801/06\nCEP 01409-06\nSão Paulo/SP | Brasil"
	ad_en = "Peixoto Gomide Street, 1801/06\nZipcode 01409-06\nSão Paulo/SP | Brazil"
	ad_es = "Rua Peixoto Gomide Street 1801/06\nCEP 01409-06\nSão Paulo/SP | Brazil"
	Company.create!(summary_pt: sm_pt, summary_en: sm_en, summary_es: sm_es, address_pt: ad_pt, address_en: ad_en, address_es: ad_es, email: "projetos@intropictures.tv", telephone: "+55 11 5696 4700")

	# Creating team
	id = Company.first.id
	Employee.create!(name: "Nome e Sobrenome", role_pt: "Cargo", role_en: "Role", role_es: "Funccione", company_id: id)
	Employee.create!(name: "Nome e Sobrenome", role_pt: "Cargo", role_en: "Role", role_es: "Funccione", company_id: id)
	Employee.create!(name: "Nome e Sobrenome", role_pt: "Cargo", role_en: "Role", role_es: "Funccione", company_id: id)
	Employee.create!(name: "Nome e Sobrenome", role_pt: "Cargo", role_en: "Role", role_es: "Funccione", company_id: id)

	# Creating departments
	Department.create!(email: "contato@intropictures.tv", name_pt: "Outro", name_es: "Otro", name_en: "Other", company_id: 1)
	Department.create!(email: "contato@intropictures.tv", name_pt: "Sugestão", name_es: "Sugestão", name_en: "Sugestão", company_id: 1)
end

case Rails.env
when "development"
   seeds_development()
when "production"
   seeds_production()
end
