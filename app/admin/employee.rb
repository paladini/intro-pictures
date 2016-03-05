ActiveAdmin.register Employee, as: "empregado" do

	menu label: "Equipe" , priority: 4
	permit_params :name, :role_pt, :role_en, :role_es

	# Defining default company to every employee
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
	filter :name
	filter :role_pt
	filter :role_en
	filter :role_es

	index do
		column :name
		column :role_pt
		column :role_en
		column :role_es
		actions
	end

	# Custom form for translated labels
	form do |f|
	    inputs do
	        input :name
		    input :role_pt
		    input :role_en
		    input :role_es
	    end
	    actions
	end

	# Custom show page for translated labels
	show do
	    attributes_table do
	    	row :id
	      	row :name
	      	row :role_pt
	      	row :role_en
	      	row :role_es
	      	row :created_at 
	      	row :updated_at
	    end
	end

end
