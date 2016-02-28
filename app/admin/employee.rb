ActiveAdmin.register Employee, as: "empregado" do

	menu label: "Equipe" , priority: 2
	permit_params :name, :role_pt, :role_en, :role_es

	# Defining default company to every employee
	before_build do |obj|
		obj.company = Company.first
	end
	
	#
	# Label-related stuff
	#
	filter :name, label: "Nome"
	filter :role_pt, label: "Cargo"
	filter :role_en, label: "Cargo (Inglês)"
	filter :role_es, label: "Cargo (Espanhol)"

	index do
		column "Nome", :name
		column "Cargo", :role_pt
		column "Cargo (Inglês)", :role_en
		column "Cargo (Espanhol)", :role_es
		actions
	end

	# Custom form for translated labels
	form do |f|
	    inputs do
	        input :name, label: "Nome"
		    input :role_pt, label: "Cargo"
		    input :role_en, label: "Cargo (Inglês)"
		    input :role_es, label: "Cargo (Espanhol)"
	    end
	    actions
	end

	# Custom show page for translated labels
	show do
	    attributes_table do
	    	row :id
	      	row("Nome"){ empregado.name }
	      	row("Cargo"){ empregado.role_pt }
	      	row("Cargo (Inglês)"){ empregado.role_en }
	      	row("Cargo (Espanhol)"){ empregado.role_es }
	      	row("Criado em"){ empregado.created_at }
	      	row("Atualizado em"){ empregado.updated_at }
	    end
	end

end
