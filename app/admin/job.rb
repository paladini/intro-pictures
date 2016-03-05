ActiveAdmin.register Job do

	menu label: "Jobs" , priority: 3
	permit_params :url, :title_pt, :title_en, :title_es, :synopsis,
				  :password, :format, :genre, :subgenre, :running_time, 
	              :target, :created_by, :written_by, :directed_by,
	              :status, :player

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
	    inputs do
	        input :url
		    input :title_pt
		    input :title_en
		    input :title_es
			input :password do |p|
				f.input p
			end
		    input :synopsis, :input_html => { rows: 1 }
			input :format, :input_html => { rows: 1 }
			input :genre, :input_html => { rows: 1 }
			input :subgenre, :input_html => { rows: 1 }
			input :running_time, :input_html => { rows: 1 }
	        input :target, :input_html => { rows: 1 }
	        input :created_by, :input_html => { rows: 1 }
	        input :written_by, :input_html => { rows: 1 }
	        input :directed_by, :input_html => { rows: 1 }
	        input :status, :input_html => { rows: 1 }
	        input :player, :input_html => { rows: 1 }
	    end
	    actions
	end

end
