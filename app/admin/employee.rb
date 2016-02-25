ActiveAdmin.register Employee, as: "empregado" do

	menu label: "Equipe" , priority: 2
	permit_params :name, :role_pt, :role_en, :role_es

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

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
