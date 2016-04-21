ActiveAdmin.register Company do

	menu label: "Configurações Gerais" , priority: 2
	actions :all, except: [:create, :new, :destroy]
	config.filters = false
	config.breadcrumb = false
    config.clear_action_items!
	permit_params :summary_pt, :summary_en, :summary_es,
				  :address_pt, :address_en, :address_es,
				  :email, :telephone #, :contact_email

	before_save do |obj|
		if !obj.valid?
			flash[:error] = "Dados não atualizados! Algum campo não foi preenchido corretamente."
	    end
	end

	#
	# Label-related stuff
	#

	# Custom form for translated labels
	form :title => "Editar Informações Gerais" do |f|
	    inputs "Resumo" do
		    input :summary_pt, :input_html => { rows: 1 }, hint: "Descrição da empresa (em português) que aparecerá no site."
		    input :summary_en, :input_html => { rows: 1 }, hint: "Descrição da empresa (em inglês) que aparecerá no site."
		    input :summary_es, :input_html => { rows: 1 }, hint: "Descrição da empresa (em espanhol) que aparecerá no site."
		end
		inputs "Endereço" do
		    input :address_pt, :input_html => { rows: 1 }, hint: "Endereço da empresa (em português) que aparecerá no site."
		    input :address_en, :input_html => { rows: 1 }, hint: "Endereço da empresa (em inglês) que aparecerá no site."
		    input :address_es, :input_html => { rows: 1 }, hint: "Endereço da empresa (em espanhol) que aparecerá no site."
		end
		inputs "Contato" do
		    input :email, :input_html => { rows: 1 }, hint: "Emails que aparecerão publicamente no site. Um email por linha."
		    input :telephone, :input_html => { rows: 1 }, hint: "Telefones que aparecerão publicamente no site. Um telefone por linha."
		    # input :contact_email, hint: "Email destinatário do formulário de contato. Não aparecerá no site."
	    end
	    actions
	end

	# Custom show page for translated labels
	show :title => "Informações Gerais" do
	    attributes_table do
	      	row :summary_pt
	      	row :summary_en
	      	row :summary_es
	      	row :address_pt
	      	row :address_en
	      	row :address_es
	      	row "Email(s)" do
	      		raw(simple_format(company.email))
	      	end
	      	row "Telefone(s)" do
	      		raw(simple_format(company.telephone))
	      	end
	      	# row :contact_email
	      	row :created_at
	      	row :updated_at
	    end
	end
	action_item :only => :show do
	    link_to "Editar informações" , edit_admin_company_path(1)
	end

end
