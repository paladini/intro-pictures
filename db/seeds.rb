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
	## Job -1
	v = Vimeo::Simple::Video.info("63694853")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2003",
				title_en: "Breaking Bad",
				title_pt: "Breaking Bad",
				title_es: "Corrompiéndose",
				format_en: "Series",
				format_pt: "Série",
				format_es: "Serie",
				genre_en: "Crime",
				genre_pt: "Crime",
				genre_es: "Crimen",
				subgenre_en: "Drama
							  Thriller",
				subgenre_pt: "Drama
							  Suspense",
				subgenre_es: "Drama
							  Novela de Suspense",
				running_time_en: "49 min",
				running_time_pt: "49 min",
				running_time_es: "49 min",
				target_en: "+16",
				target_pt: "+16",
				target_es: "+16",
				created_by_en: "Vince Gilligan",
				created_by_pt: "Vince Gilligan",
				created_by_es: "Vince Gilligan",
				written_by_en: "Vince Gilligan
								Peter Gould
								George Mastras
								Sam Catlin
								Moira Walley-Beckett",
				written_by_pt: "Vince Gilligan
								Peter Gould
								George Mastras
								Sam Catlin
								Moira Walley-Beckett",
				written_by_es: "Vince Gilligan
								Peter Gould
								George Mastras
								Sam Catlin
								Moira Walley-Beckett",				
				directed_by_en: "Vince Gilligan
								Michelle MacLaren
								Adam Bernstein
								Colin Bucksey
								Michael Slovis
								Peter Gould",
				directed_by_pt: "Vince Gilligan
								Michelle MacLaren
								Adam Bernstein
								Colin Bucksey
								Michael Slovis
								Peter Gould",
				directed_by_es: "Vince Gilligan
								Michelle MacLaren
								Adam Bernstein
								Colin Bucksey
								Michael Slovis
								Peter Gould",
				status_en: "Completed",
				status_pt: "Completa",
				status_es: "Concluído",
				player: "Bryan Cranston
						Aaron Paul
						Anna Gunn
						Dean Norris
						Betsy Brandt
						RJ Mitte",
				synopsis_en: "When chemistry teacher Walter White is diagnosed with Stage III cancer and given only two years to live, he decides he has nothing to lose. He lives with his teenage son, who has cerebral palsy, and his wife, in New Mexico. Determined to ensure that his family will have a secure future, Walt embarks on a career of drugs and crime. He proves to be remarkably proficient in this new world as he begins manufacturing and selling methamphetamine with one of his former students. The series tracks the impacts of a fatal diagnosis on a regular, hard working man, and explores how a fatal diagnosis affects his morality and transforms him into a major player of the drug trade.",
				synopsis_pt: "Ao professor da química Walter White é diagnosticado com câncer em estágio III e dado apenas dois anos de vida, ele decide que não tem nada a perder. Ele vive com seu filho adolescente, que tem paralisia cerebral, e sua esposa, no Novo México. Determinado a garantir que sua família vai ter um futuro seguro, Walt embarca em uma carreira de drogas e crime. Ele revela-se extremamente proficientes neste novo mundo como ele começa fabricação e venda de metanfetamina com um de seus ex-alunos. A série acompanha os impactos de um diagnóstico fatal em um homem muito trabalhador regular, e explora como um diagnóstico fatal afeta sua moralidade e transforma-lo em um grande jogador do tráfico de drogas.",
				synopsis_es: "Cuando el maestro de química Walter White es diagnosticada con cáncer en estadio III y dado sólo dos años de vida, él decide que no tiene nada que perder. Vive con su hijo adolescente, que tiene parálisis cerebral, y su esposa, en Nuevo México. Decidido a asegurar que su familia tendrá un futuro seguro, Walt se embarca en una carrera de drogas y el crimen. Él demuestra ser muy competentes en este nuevo mundo a medida que comienza la fabricación y venta de metanfetamina con uno de sus antiguos alumnos. La serie sigue los impactos de un diagnóstico fatal en un hombre normal, trabajando duro, y explora cómo un diagnóstico fatal afecta a su moral y lo transforma en un jugador importante del tráfico de drogas."
	)

	## Job 0
	v = Vimeo::Simple::Video.info("104257521")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2014",
				title_en: "True Detective",
				title_pt: "True Detective",
				title_es: "True Detective",
				format_en: "Series",
				format_pt: "Série",
				format_es: "Serie",
				genre_en: "Crime",
				genre_pt: "Crime",
				genre_es: "Crimen",
				subgenre_en: "Drama
							  Thriller
							  Mistery",
				subgenre_pt: "Drama
							  Suspense
							  Mistério",
				subgenre_es: "Drama
							  Novela de Suspense
							  Misterio",
				running_time_en: "55 min",
				running_time_pt: "55 min",
				running_time_es: "55 min",
				target_en: "+18",
				target_pt: "+18",
				target_es: "+18",
				created_by_en: "Nic Pizzolatto",
				created_by_pt: "Nic Pizzolatto",
				created_by_es: "Nic Pizzolatto",
				written_by_en: "Nic Pizzolatto
								Scott Lasser
								Amanda Overton",
				written_by_pt: "Nic Pizzolatto
								Scott Lasser
								Amanda Overton",
				written_by_es: "Nic Pizzolatto
								Scott Lasser
								Amanda Overton",											
				directed_by_en: "Cary Joji Fukunaga
								John Crowley
								Justin Lin
								Daniel Attias
								Janus Metz Pedersen",
				directed_by_pt: "Cary Joji Fukunaga
								John Crowley
								Justin Lin
								Daniel Attias
								Janus Metz Pedersen",
				directed_by_es: "Cary Joji Fukunaga
								John Crowley
								Justin Lin
								Daniel Attias
								Janus Metz Pedersen",						
				status_en: "In Progress",
				status_pt: "Em Andamento",
				status_es: "En Curso",
				player: "Matthew McConaughey
						Colin Farrell
						Woody Harrelson
						Rachel McAdams
						Michelle Monaghan
						Taylor Kitsch
						Michael Potts",
				synopsis_en: "In 2012, Louisiana State Police Detectives Rust Cohle and Martin Hart are brought in to revisit a homicide case they worked in 1995. As the inquiry unfolds in present day through separate interrogations, the two former detectives narrate the story of their investigation, reopening unhealed wounds, and drawing into question their supposed solving of a bizarre ritualistic murder in 1995. The timelines braid and converge in 2012 as each man is pulled back into a world they believed they'd left behind. In learning about each other and their killer, it becomes clear that darkness lives on both sides of the law.",
				synopsis_pt: "Em 2012, a polícia do estado de Louisiana Detectives Rust Cohle e Martin Hart são trazidos para revisitar um caso de homicídio que trabalharam em 1995. A investigação se desdobra em dia presente através de interrogatórios separados, os dois ex-detetives narrar a história de sua investigação, reabrindo feridas não cicatrizadas e desenho em causa a sua suposta resolução de um assassinato ritual bizarro em 1995. A cronogramas trança e convergem em 2012 à medida que cada homem é puxado para trás em um mundo que eles acreditavam que havia deixado para trás. Em aprender sobre si e seu assassino, torna-se claro que a escuridão vive em ambos os lados da lei.",
				synopsis_es: "En 2012, la Policía del Estado de Louisiana Detectives Rust Cohle y Martin Hart son traídos a revisar un caso de homicidio que trabajaban en 1995. Como la investigación se desarrolla en nuestros días a través de interrogatorios separados, los dos ex detectives narran la historia de su investigación, la reapertura de heridas sin cicatrizar , y el dibujo en tela de juicio su supuesta resolución de un asesinato ritual extraño en 1995. La trenza de líneas de tiempo y convergen en el año 2012, ya que cada hombre se tira de nuevo en un mundo que se creía que habían dejado atrás. Al aprender el uno del otro y de su asesino, se hace evidente que la oscuridad vive en ambos lados de la ley."
	)

	## Job 1
	v = Vimeo::Simple::Video.info("102584781")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2013",
				title_en: "The Business",
				title_pt: "O Negócio",
				title_es: "El Negocio",
				format_en: "Series",
				format_pt: "Série",
				format_es: "Serie",
				genre_en: "Comedy",
				genre_pt: "Comédia",
				genre_es: "Comedia",
				subgenre_en: "Drama",
				subgenre_pt: "Drama",
				subgenre_es: "Drama",
				running_time_en: "51 min",
				running_time_pt: "51 min",
				running_time_es: "51 min",
				target_en: "+18",
				target_pt: "+18",
				target_es: "+18",
				created_by_en: "Rodrigo Castilho
								Luca Paiva Mello",
				created_by_pt: "Rodrigo Castilho
								Luca Paiva Mello",
				created_by_es: "Rodrigo Castilho
								Luca Paiva Mello",
				written_by_en: "Fabio Danesi
								Rodrigo Castilho
								Luca Paiva Mello
								Camila Raffanti
								Alexandre Soares Silva",
				written_by_pt: "Fabio Danesi
								Rodrigo Castilho
								Luca Paiva Mello
								Camila Raffanti
								Alexandre Soares Silva",
				written_by_es: "Fabio Danesi
								Rodrigo Castilho
								Luca Paiva Mello
								Camila Raffanti
								Alexandre Soares Silva",											
				directed_by_en: "Michel Tikhomiroff
								Júlia Pacheco Jordão",
				directed_by_pt: "Michel Tikhomiroff
								Júlia Pacheco Jordão",
				directed_by_es: "Michel Tikhomiroff
								Júlia Pacheco Jordão",						
				status_en: "In Progress",
				status_pt: "Em Andamento",
				status_es: "En Curso",
				player: "Rafaela Mandelli
						Juliana Schalch
						Michelle Batista
						João Gabriel Vasconcellos
						Gabriel Godoy
						Kauê Telloli
						Guilherme Weber",
				synopsis_en: "The serie tells the story of Karin, Moon and Magali, três mulheres belas that buscam revolução fazer uma na sua Profissão. Sem na carreira up perspective, we implemented uma nova elas marketing strategy to Profissão mais antiga do mundo: prostituição, and a business mulheres tornarão.",
				synopsis_pt: "A série conta a história de Karin, Luna e Magali, três belas mulheres que buscam fazer uma revolução na sua profissão. Sem perspectiva de subir na carreira, elas aplicam uma nova estratégia de marketing para a profissão mais antiga do mundo: prostituição, e se tornarão mulheres de negócios.",
				synopsis_es: "Una série conta una história de Karin, Luna e Magali, Tres Belas mulheres Que buscam fazer uma revolução na sua Profissão. Sem perspectiva de subir na Carreira, elas aplicam uma nova Estrategia de comercialización para un Profissão mais antiga do Mundo: prostituição, e se tornarão Mulheres de Negocios."
	)

	## Job 2
	v = Vimeo::Simple::Video.info("161699904")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/channels/staffpicks/161699904",
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2011",
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
				status_en: "Status",
				status_pt: "Status",
				status_es: "Status"
	)
	
	## Job 3
	v = Vimeo::Simple::Video.info("70642037")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2011",
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
				status_en: "Status",
				status_pt: "Status",
				status_es: "Status"
	)

	## Job 4
	v = Vimeo::Simple::Video.info("156412748")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2011",
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
				status_en: "Status",
				status_pt: "Status",
				status_es: "Status"
	)

	## Job 5
	v = Vimeo::Simple::Video.info("151401087")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2011",
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
				status_en: "Status",
				status_pt: "Status",
				status_es: "Status"
	)

	## Job 6
	v = Vimeo::Simple::Video.info("67042448")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2011",

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
				status_en: "Status",
				status_pt: "Status",
				status_es: "Status"
	)

	## Job 7
	v = Vimeo::Simple::Video.info("23291224")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2011",

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
				status_en: "Status",
				status_pt: "Status",
				status_es: "Status"
	)

	## Job 8
	v = Vimeo::Simple::Video.info("149800435")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				year: "2011",
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
				status_en: "Status",
				status_pt: "Status",
				status_es: "Status"
	)

	## Job 9
	v = Vimeo::Simple::Video.info("35982411")
	Job.create!(video_id: v[0]["id"],
				video_url: "https://vimeo.com/" + v[0]["id"].to_s,
				video_thumb_small: v[0]["thumbnail_small"],
				video_thumb_medium: v[0]["thumbnail_medium"],
				video_thumb_large: v[0]["thumbnail_large"],
				title_en: "Original Title",
				title_pt: "Título Original",
				title_es: "Título Original",
				format_en: "Format",
				format_pt: "Formato",
				format_es: "Formato",
				genre_en: "Genre",
				genre_pt: "Gênero",
				genre_es: "Género",
				subgenre_en: "Subgenre",
				subgenre_pt: "Subgênero",
				subgenre_es: "Subgénero",
				running_time_en: "Running Time",
				running_time_pt: "Duração",
				running_time_es: "Duración",
				target_en: "Target Audience",
				target_pt: "Público-alvo",
				target_es: " Público-Objetivo",
				created_by_en: "Created by",
				created_by_pt: "Criado por",
				created_by_es: "Criado por",
				written_by_en: "Written by",
				written_by_pt: "Escrito por",
				written_by_es: "Escrito por",
				directed_by_en: "Guilherme Floriano",
				directed_by_pt: "Guilherme Floriano",
				directed_by_es: "Guilherme Floriano",
				status_en: "Status",
				status_pt: "Status",
				status_es: "Status",
				player: "Atores",
				synopsis_en: v[0]["description"],
				synopsis_pt: v[0]["description"],
				synopsis_es: v[0]["description"]
	)

end

case Rails.env
when "development"
   seeds_development()
when "production"
   seeds_production()
end
