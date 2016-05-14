ActiveAdmin.register Department do

	menu label: "Formulário de Contato" , priority: 5
	permit_params :name_pt, :name_es, :name_en, :email

	# Defining default contact to every department
	before_build do |obj|
		obj.company = Company.first
	end
	before_save do |obj|
		if !obj.valid?
			flash[:error] = "Dados não atualizados! Algum campo não foi preenchido corretamente."
	    end
	end

	#
	# Label-related stuff
	#
	filter :name_pt
	filter :name_en
	filter :name_es
	filter :email

	index :title => "Departamentos" do
		column :email
		column :name_pt
		column :name_en
		column :name_es
		actions
	end

	# Custom form for translated labels
	form do |f|
	    inputs do
	    	input :email
		    input :name_pt
			input :name_en
			input :name_es
	    end
	    actions
	end

	# Custom show page for translated labels
	show do
	    attributes_table do
	    	row :id
			row :email
	      	row :name_pt
			row :name_en
			row :name_es
	      	row :created_at 
	      	row :updated_at
	    end
	end

end
