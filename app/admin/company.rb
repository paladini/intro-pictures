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
	    inputs do
		    input :summary_pt
		    input :summary_en
		    input :summary_es
		    input :address_pt
		    input :address_en
		    input :address_es
		    input :email
		    input :telephone
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
	      	row :email
	      	row :telephone
	      	row :created_at
	      	row :updated_at
	    end
	end
	action_item :only => :show do
	    link_to "Editar informações" , edit_admin_company_path(1)
	end

end
