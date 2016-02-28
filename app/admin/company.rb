ActiveAdmin.register Company do

	menu label: "Configurações Gerais" , priority: 2
	actions :all, except: [:create, :new, :destroy]
	config.filters = false
	config.breadcrumb = false
    config.clear_action_items!
	permit_params :summary_pt, :summary_en, :summary_es,
				  :address_pt, :address_en, :address_es,
				  :email, :telephone

	#
	# Label-related stuff
	#

	# Custom form for translated labels
	form :title => "Editar Informações Gerais" do |f|
	    inputs do
		    input :summary_pt, label: "Resumo"
		    input :summary_en, label: "Resumo (Inglês)"
		    input :summary_es, label: "Resumo (Espanhol)"
		    input :address_pt, label: "Endereço"
		    input :address_en, label: "Endereço (Inglês)"
		    input :address_es, label: "Endereço (Espanhol)"
		    input :email, label: "Email"
		    input :telephone, label: "Telefone"
	    end
	    actions
	end

	# Custom show page for translated labels
	show :title => "Informações Gerais" do
	    attributes_table_for Company do
	      	row("Resumo"){ company.summary_pt }
	      	row("Resumo (Inglês)"){ company.summary_en }
	      	row("Resumo (Espanhol)"){ company.summary_es }
	      	row("Endereço"){ company.address_pt }
	      	row("Endereço (Inglês)"){ company.address_en }
	      	row("Endereço (Espanhol)"){ company.address_es }
	      	row("Email"){ company.email }
	      	row("Telefone"){ company.telephone }
	      	row("Criado em"){ company.created_at }
	      	row("Atualizado em"){ company.updated_at }
	    end
	end
	action_item :only => :show do
	    link_to "Editar informações" , edit_admin_company_path(1)
	end

end
