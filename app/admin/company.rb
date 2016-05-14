ActiveAdmin.register Company do

	menu label: "Configurações Gerais" , priority: 2
	actions :all, except: [:create, :new, :destroy]
	config.filters = false
	config.breadcrumb = false
    config.clear_action_items!
	permit_params :summary_pt, :summary_en, :summary_es,
				  :address_pt, :address_en, :address_es,
				  :email, :telephone

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
		    input :email, :input_html => { rows: 1 }, hint: "Emails que aparecerão publicamente para os usuários do site. Um email por linha. Não está relacionado com os e-mails do formulário de contato, se deseja modificar os e-mails do formulário de contato vá no menu \"Formulário de Contato\"."
		    input :telephone, :input_html => { rows: 1 }, hint: "Um telefone por linha. Telefones que aparecerão publicamente no site."
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
	      	row :created_at
	      	row :updated_at
	    end
	end
	action_item :only => :show do
	    link_to "Editar informações" , edit_admin_company_path(1)
	end

end
