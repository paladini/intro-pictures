ActiveAdmin.register Job do

	menu label: "Jobs" , priority: 3
	permit_params :url, 
	              :status, 
	              :player,
				  :password, 
				  :title_pt, :title_en, :title_es, 
				  :genre_pt, :genre_en, :genre_es,
	              :target_pt, :target_en, :target_es, 
				  :format_pt, :format_en, :format_es, 
				  :synopsis_pt, :synopsis_en, :synopsis_es,
				  :subgenre_pt, :subgenre_en, :subgenre_es,
	              :created_by_pt, :created_by_en, :created_by_es,
	              :written_by_pt, :written_by_en, :written_by_es,
	              :directed_by_pt, :directed_by_en, :directed_by_es,
				  :running_time_pt, :running_time_en, :running_time_es

	before_save do |obj|
		if !obj.valid?
			flash[:error] = "Dados não atualizados! Algum campo não foi preenchido corretamente."
		end
	end

	#
	# Label-related stuff
	#
	index do
		column :title_pt
		column :url
		column "Protegido | Privado", :password do |obj|
			obj.password.empty? ? "Não" : "Sim"
		end
		column :running_time
		column :status
		actions
	end

	# form partial: "form"

	# Custom form for translated labels
	form do |f|
	    inputs "Informações Básicas" do
	        input :url, hint: "Link para um vídeo ou álbum do Vimeo."
		    input :title_pt
		    input :title_en
		    input :title_es
			input :password, hint: "Se este campo for preenchido, o Job será exibido na página mas exigirá senha para ser visto."
		end

		inputs "Sinopse" do
			input :synopsis_pt, :input_html => { rows: 1 }, hint: ""
			input :synopsis_en, :input_html => { rows: 1 }, hint: ""
			input :synopsis_es, :input_html => { rows: 1 }, hint: ""
		end

		inputs "Formato" do
			input :format_pt, :input_html => { rows: 1 }
			input :format_en, :input_html => { rows: 1 }
			input :format_es, :input_html => { rows: 1 }
		end

		inputs "Gênero e Subgênero" do
			input :genre_pt, :input_html => { rows: 1 }
			input :genre_en, :input_html => { rows: 1 }
			input :genre_es, :input_html => { rows: 1 }

			input :subgenre_pt, :input_html => { rows: 1 }
			input :subgenre_en, :input_html => { rows: 1 }
			input :subgenre_es, :input_html => { rows: 1 }
		end

		inputs "Duração" do
			input :running_time_pt, :input_html => { rows: 1 }
			input :running_time_en, :input_html => { rows: 1 }
			input :running_time_es, :input_html => { rows: 1 }
		end

		inputs "Público" do
			input :target_pt, :input_html => { rows: 1 }
	        input :target_en, :input_html => { rows: 1 }
	        input :target_es, :input_html => { rows: 1 }
	    end

	    inputs "Criado por" do
	    	input :created_by_pt, :input_html => { rows: 1 }
	        input :created_by_en, :input_html => { rows: 1 }
	        input :created_by_es, :input_html => { rows: 1 }
	    end

	    inputs "Escrito por" do
	    	input :written_by_pt, :input_html => { rows: 1 }
	        input :written_by_en, :input_html => { rows: 1 }
	        input :written_by_es, :input_html => { rows: 1 }
	    end

	    inputs "Dirigido por" do
	    	input :directed_by_pt, :input_html => { rows: 1 }
	        input :directed_by_en, :input_html => { rows: 1 }
	        input :directed_by_es, :input_html => { rows: 1 }
	    end

	    inputs "Outras informações" do
	        input :status, :input_html => { rows: 1 }
	        input :player, :input_html => { rows: 1 }
	    end
	    actions
	end

end
