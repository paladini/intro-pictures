# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seeds_production()
	puts "Running seeds for production..."
	seeds_development()
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

	# Creating jobs
	## Job 1
	v = Vimeo::Simple::Video.info("42289840")
	Job.create!(video_id: v[0]["id"], 
				video_url: "https://vimeo.com/42289840",
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				title_en: v[0]["title"],
				title_pt: v[0]["title"],
				title_es: v[0]["title"],
				synopsis_en: v[0]["description"],
				synopsis_pt: v[0]["description"],
				synopsis_es: v[0]["description"],
				genre_en: "Horror",
				genre_pt: "Horror",
				genre_es: "Horror",
				subgenre_en: "Gotic",
				subgenre_pt: "Gotic",
				subgenre_es: "Gotic",
				written_by_en: "Fernando Paladini",
				written_by_pt: "Fernando Paladini",
				written_by_es: "Fernando Paladini",
				directed_by_en: "Guilherme Floriano",
				directed_by_pt: "Guilherme Floriano",
				directed_by_es: "Guilherme Floriano",
				target_en: "Teenegers",
				target_pt: "Adolescentes",
				target_es: "Adolescentes",
				status: "I don't know"
	)

	## Job 2
	v = Vimeo::Simple::Video.info("161699904")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/channels/staffpicks/161699904",
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				title_en: v[0]["title"],
				title_pt: v[0]["title"],
				title_es: v[0]["title"],
				synopsis_en: v[0]["description"],
				synopsis_pt: v[0]["description"],
				synopsis_es: v[0]["description"],
				genre_en: "Horror",
				genre_pt: "Horror",
				genre_es: "Horror",
				subgenre_en: "Gotic",
				subgenre_pt: "Gotic",
				subgenre_es: "Gotic",
				written_by_en: "Fernando Paladini",
				written_by_pt: "Fernando Paladini",
				written_by_es: "Fernando Paladini",
				directed_by_en: "Guilherme Floriano",
				directed_by_pt: "Guilherme Floriano",
				directed_by_es: "Guilherme Floriano",
				target_en: "Teenegers",
				target_pt: "Adolescentes",
				target_es: "Adolescentes",
				status: "I don't know"
	)
	
	## Job 3
	v = Vimeo::Simple::Video.info("70642037")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				title_en: v[0]["title"],
				title_pt: v[0]["title"],
				title_es: v[0]["title"],
				synopsis_en: v[0]["description"],
				synopsis_pt: v[0]["description"],
				synopsis_es: v[0]["description"],
				genre_en: "Horror",
				genre_pt: "Horror",
				genre_es: "Horror",
				subgenre_en: "Gotic",
				subgenre_pt: "Gotic",
				subgenre_es: "Gotic",
				written_by_en: "Fernando Paladini",
				written_by_pt: "Fernando Paladini",
				written_by_es: "Fernando Paladini",
				directed_by_en: "Guilherme Floriano",
				directed_by_pt: "Guilherme Floriano",
				directed_by_es: "Guilherme Floriano",
				target_en: "Teenegers",
				target_pt: "Adolescentes",
				target_es: "Adolescentes",
				status: "I don't know"
	)

	## Job 4
	v = Vimeo::Simple::Video.info("156412748")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				title_en: v[0]["title"],
				title_pt: v[0]["title"],
				title_es: v[0]["title"],
				synopsis_en: v[0]["description"],
				synopsis_pt: v[0]["description"],
				synopsis_es: v[0]["description"],
				genre_en: "Horror",
				genre_pt: "Horror",
				genre_es: "Horror",
				subgenre_en: "Gotic",
				subgenre_pt: "Gotic",
				subgenre_es: "Gotic",
				written_by_en: "Fernando Paladini",
				written_by_pt: "Fernando Paladini",
				written_by_es: "Fernando Paladini",
				directed_by_en: "Guilherme Floriano",
				directed_by_pt: "Guilherme Floriano",
				directed_by_es: "Guilherme Floriano",
				target_en: "Teenegers",
				target_pt: "Adolescentes",
				target_es: "Adolescentes",
				status: "I don't know"
	)

	## Job 5
	v = Vimeo::Simple::Video.info("151401087")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				title_en: v[0]["title"],
				title_pt: v[0]["title"],
				title_es: v[0]["title"],
				synopsis_en: v[0]["description"],
				synopsis_pt: v[0]["description"],
				synopsis_es: v[0]["description"],
				genre_en: "Horror",
				genre_pt: "Horror",
				genre_es: "Horror",
				subgenre_en: "Gotic",
				subgenre_pt: "Gotic",
				subgenre_es: "Gotic",
				written_by_en: "Fernando Paladini",
				written_by_pt: "Fernando Paladini",
				written_by_es: "Fernando Paladini",
				directed_by_en: "Guilherme Floriano",
				directed_by_pt: "Guilherme Floriano",
				directed_by_es: "Guilherme Floriano",
				target_en: "Teenegers",
				target_pt: "Adolescentes",
				target_es: "Adolescentes",
				status: "I don't know"
	)

	## Job 6
	v = Vimeo::Simple::Video.info("67042448")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				title_en: v[0]["title"],
				title_pt: v[0]["title"],
				title_es: v[0]["title"],
				synopsis_en: v[0]["description"],
				synopsis_pt: v[0]["description"],
				synopsis_es: v[0]["description"],
				genre_en: "Horror",
				genre_pt: "Horror",
				genre_es: "Horror",
				subgenre_en: "Gotic",
				subgenre_pt: "Gotic",
				subgenre_es: "Gotic",
				written_by_en: "Fernando Paladini",
				written_by_pt: "Fernando Paladini",
				written_by_es: "Fernando Paladini",
				directed_by_en: "Guilherme Floriano",
				directed_by_pt: "Guilherme Floriano",
				directed_by_es: "Guilherme Floriano",
				target_en: "Teenegers",
				target_pt: "Adolescentes",
				target_es: "Adolescentes",
				status: "I don't know"
	)

	## Job 7
	v = Vimeo::Simple::Video.info("23291224")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				title_en: v[0]["title"],
				title_pt: v[0]["title"],
				title_es: v[0]["title"],
				synopsis_en: v[0]["description"],
				synopsis_pt: v[0]["description"],
				synopsis_es: v[0]["description"],
				genre_en: "Horror",
				genre_pt: "Horror",
				genre_es: "Horror",
				subgenre_en: "Gotic",
				subgenre_pt: "Gotic",
				subgenre_es: "Gotic",
				written_by_en: "Fernando Paladini",
				written_by_pt: "Fernando Paladini",
				written_by_es: "Fernando Paladini",
				directed_by_en: "Guilherme Floriano",
				directed_by_pt: "Guilherme Floriano",
				directed_by_es: "Guilherme Floriano",
				target_en: "Teenegers",
				target_pt: "Adolescentes",
				target_es: "Adolescentes",
				status: "I don't know"
	)

	## Job 7
	v = Vimeo::Simple::Video.info("149800435")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				title_en: v[0]["title"],
				title_pt: v[0]["title"],
				title_es: v[0]["title"],
				synopsis_en: v[0]["description"],
				synopsis_pt: v[0]["description"],
				synopsis_es: v[0]["description"],
				genre_en: "Horror",
				genre_pt: "Horror",
				genre_es: "Horror",
				subgenre_en: "Gotic",
				subgenre_pt: "Gotic",
				subgenre_es: "Gotic",
				written_by_en: "Fernando Paladini",
				written_by_pt: "Fernando Paladini",
				written_by_es: "Fernando Paladini",
				directed_by_en: "Guilherme Floriano",
				directed_by_pt: "Guilherme Floriano",
				directed_by_es: "Guilherme Floriano",
				target_en: "Teenegers",
				target_pt: "Adolescentes",
				target_es: "Adolescentes",
				status: "I don't know"
	)

end

case Rails.env
when "development"
   seeds_development()
when "production"
   seeds_production()
end
