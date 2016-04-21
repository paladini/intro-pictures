# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# Creating Intro-Pictures basic info.
sm_pt = "Minha descrição favorita."
sm_en = "My favorite description."
sm_es = "Mi descripción favorita."
ad_pt = "Rua Peixoto Gomide 1801/06\nCEP 01409-06\nSão Paulo/SP | Brasil"
ad_en = "Peixoto Gomide Street, 1801/06\nZipcode 01409-06\nSão Paulo/SP | Brazil"
ad_es = "Rua Peixoto Gomide Street 1801/06\nCEP 01409-06\nSão Paulo/SP | Brazil"
Company.create!(summary_pt: sm_pt, summary_en: sm_en, summary_es: sm_es, 
				address_pt: ad_pt, address_en: ad_en, address_es: ad_es,
				email: "projetos@intropictures.tv", telephone: "+55 11 5696 4700") #, contact_email: "contato@intropictures.tv")

# Creates default departments to contact
Contact.create(email: "contato@intropictures.tv")
Department.create!(name_pt: "Outro", name_es: "Otro", name_en: "Other", contact_id: 1)