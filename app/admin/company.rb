ActiveAdmin.register Company do


	menu label: "Configurações Gerais" , priority: 2
	actions :all, except: [:create, :new, :destroy] #, :index]
	config.filters = false
	config.breadcrumb = false
	permit_params :resumo_pt, :resumo_en, :resumo_es,
				  :endereco_pt, :endereco_en, :enrereco_es,
				  :email, :telefone

	#
	# Label-related stuff
	#
	# index do
	# 	column "Resumo", :name
	# 	column "Endereço", :role_pt
	# 	column "E-mail", :role_en
	# 	column "Telefone", :role_es
	# 	column "Data de criação", :created_at
	# 	column "Data de última atualização", :updated_at
	# 	actions
	# end

	# Custom form for translated labels
	form :title => "Editar Informações Gerais" do |f|
	    inputs do
		    input :resumo_pt, label: "Resumo"
		    input :resumo_en, label: "Resumo (Inglês)"
		    input :resumo_es, label: "Resumo (Espanhol)"
		    input :endereco_pt, label: "Endereço"
		    input :endereco_en, label: "Endereço (Inglês)"
		    input :endereco_es, label: "Endereço (Espanhol)"
		    input :email, label: "Email"
		    input :telefone, label: "Telefone"
	    end
	    actions
	end
	# action_item :only => :edit do
	#     link_to "Atualizar" , edit_admin_company_path(1)
	# end

	# Custom show page for translated labels
	show :title => "Informações Gerais" do
		# panel "" do
		# 	table_for company do
		# 		column("Resumo"){ :resumo_pt }
		# 		column("Resumo (Inglês)"){ :resumo_en }
		# 		column("Resumo (Espanhol)"){ :resumo_es }
		# 	end

		# 	table_for company do
		# 		column("Endereço"){ :resumo_pt }
		# 		column("Endereço (Inglês)"){ :resumo_en }
		# 		column("Endereço (Espanhol)"){ :resumo_es }
		# 	end
		# end
	    attributes_table_for Company do
	      	row("Resumo"){ company.resumo_pt }
	      	row("Resumo (Inglês)"){ company.resumo_en }
	      	row("Resumo (Espanhol)"){ company.resumo_es }
	      	row("Endereço"){ company.endereco_pt }
	      	row("Endereço (Inglês)"){ company.endereco_en }
	      	row("Endereço (Espanhol)"){ company.endereco_es }
	      	row("Email"){ company.email }
	      	row("Telefone"){ company.telefone }
	      	row("Criado em"){ company.created_at }
	      	row("Atualizado em"){ company.updated_at }
	    end
	end

    config.clear_action_items!
	action_item :only => :show do
	    link_to "Editar informações" , edit_admin_company_path(1)
	end

	# # @company_form = Company.first
	# index do |obj|
	# 	# div for: @testing do
	# 	# 	@testing
	# 	# end
	# 	# form_for @company_form do |f|
	# 	# 	f.label "Resumo"
	# 	# 	f.text_field :resumo_pt
	# 	# end
	# 	# columns do
	# 	# 	column do
	# 	# 		panel "Resumo" do
	# 	# 			form do |f|
	# 	# 			    # inputs do
	# 	# 			        input :resumo_pt, label: "Nome"
	# 	# 				    input :resumo_en, label: "Cargo"
	# 	# 				    input :resumo_es, label: "Cargo (Inglês)"
	# 	# 			    # end
	# 	# 			    # actions
	# 	# 			end
	# 	# 		end
	# 	# 	end
	# 	# end
	#   # div for: obj do
	#   #   resource_selection_cell obj
	#   #   h2  auto_link     obj.resumo_pt
	#   #   div simple_format obj.endereco_pt
	#   # end
	# end


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
