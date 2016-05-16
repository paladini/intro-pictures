ActiveAdmin.register Job do

	menu label: "Portfólio" , priority: 3
	permit_params :video_id, 
				  :video_url,
				  :video_thumb_small, :video_thumb_medium, :video_thumb_large,
	              :status_en, :stauts_pt, :status_es,
	              :player,
				  :password,
				  :year,
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
	filter :title_pt
	filter :video_url
	filter :genre_pt
	filter :synopsis_pt

	index do
		column :title_en
		column :video_url
		column "Privado", :password do |obj|
			obj.password.blank? ? "Não" : "Sim"
		end
		column :year
		actions
	end

	# Custom form for translated labels
	form do |f|
	    inputs "Informações Básicas" do
	        input :video_url, hint: "Link para um vídeo do Vimeo."
	        li do 
	        	'<label id="input_thumbnail" class="label">Miniatura do vídeo</label>
	        	<p class="inline-hints">A miniatura do vídeo será obtida quando um vídeo do Vimeo for inserido.</p>
	        	'.html_safe
	        end
	        input :video_thumb_small, as: :hidden
	        input :video_thumb_medium, as: :hidden
	        input :video_thumb_large, as: :hidden
	        input :video_id, as: :hidden
		    input :title_pt
		    input :title_en
		    input :title_es
		    input :year
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
	        input :status_pt, :input_html => { rows: 1 }
	        input :status_en, :input_html => { rows: 1 }
	        input :status_es, :input_html => { rows: 1 }
	        input :player, :input_html => { rows: 1 }
	    end
	    actions
	end

	show title: :title_en do
	    attributes_table do
	    	row :video_url
	    	row "Miniatura" do
		        image_tag(job.video_thumb_large)
			end
	        row :status_pt
	        row :status_en
	        row :status_es
	        row :year
	        row :player
			row :password
			row :title_pt
			row :title_en
			row :title_es
			row :genre_pt
			row :genre_en
			row :genre_es
	        row :target_pt
	        row :target_en
	        row :target_es
			row :format_pt
			row :format_en
			row :format_es
			row :synopsis_pt
			row :synopsis_en
			row :synopsis_es
			row :subgenre_pt
			row :subgenre_en
			row :subgenre_es
	        row :created_by_pt
	        row :created_by_en
	        row :created_by_es
	        row :written_by_pt
	        row :written_by_en
	        row :written_by_es
	        row :directed_by_pt
	        row :directed_by_en
	        row :directed_by_es
			row :running_time_pt
			row :running_time_en
			row :running_time_es
	      	row :created_at 
	      	row :updated_at
	    end
	end

end
