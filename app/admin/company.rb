ActiveAdmin.register Company do

	menu label: "Informações da Empresa" , priority: 2
	actions :all, except: [:create, :new, :destroy]
	config.filters = false
	config.breadcrumb = false
    config.clear_action_items!
	permit_params :summary_pt, :summary_en, :summary_es,
				  :address_pt, :address_en, :address_es,
				  :email, :telephone,
				  employees: [:id, :name, :role_en, :role_pt, :role_es]

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
	 #    inputs "TEst" do
		#     f.has_many :employees, heading: 'Themes', new_record: false do |a|
	 #    		a.input :name
		#     end
		# end
	    actions
	end

	# Custom show page for translated labels
	show :title => "Informações Gerais" do
		panel "Informações da empresa" do
		    attributes_table_for company do
		      	row "Resumo" do
		      		raw(simple_format(company.summary_pt))
		      	end
		      	row "Resumo (Inglês)" do
		      		raw(simple_format(company.summary_en))
		      	end
		      	row "Resumo (Espanhol)" do
		      		raw(simple_format(company.summary_es))
		      	end
		      	row "Endereço" do
		      		raw(simple_format(company.address_pt))
		      	end
		      	row "Endereço (Inglês)" do 
		      		raw(simple_format(company.address_en))
		      	end
		      	row "Endereço (Espanhol)" do 
		      		raw(simple_format(company.address_es))
		      	end
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
		
		panel "Equipe" do

			# div class: "action_items title_bar" do
			# 	span class: "action_item" do 
			# 		link_to "Adicionar membro", new_admin_empregado_path
			# 	end
			# 	# span class: "action_item" do 
			# 	# 	link_to "Adicionar membro", new_admin_empregado_path
			# 	# end
			# end
	      	table_for company.employees do
	        	column :name
	        	column :role_pt
	        	column do |e|
	        		div class: "table_actions" do
		        		link_to('Visualizar', admin_empregado_path(e.id), class: "member_link") +
		        		link_to('Editar', edit_admin_empregado_path(e.id), class: "member_link") +
		        		link_to('Remover', admin_empregado_path(e.id), class: "member_link", method: :delete, data: { confirm: 'Are you sure?' })
	        		end
	        	end
	      	end
	    end
	    # attributes_table do
	    #   	# row :summary_pt
	    #   	# row :
	    # end
	 #    index do
		# 	column :name
		# 	column :role_pt
		# 	column :role_en
		# 	column :role_es
		# 	# actions
		# end
	end
	action_item :only => :show do
	    link_to "Editar informações" , edit_admin_company_path(1)

	end
	action_item :only => :show do
	    link_to "Gerenciar equipe" , admin_empregados_path
	end


	# sidebar "Details", only: :show do
	#     # attributes_table_for company do
	#     #   	row :email
	#     #   	row :telephone
	#     # end

	# end

end
