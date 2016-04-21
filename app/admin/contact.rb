ActiveAdmin.register Contact, as: "contato" do

	menu label: "Contato" , priority: 5
	actions :all, except: [:create, :new, :destroy]
	config.filters = false
	config.breadcrumb = false
    # config.clear_action_items!
	permit_params :email, department_attributes: [:id, :name_pt, :name_es, :name_en]

	before_save do |obj|
		if !obj.valid?
			flash[:error] = "Dados não atualizados! Algum campo não foi preenchido corretamente."
	    end
	end

	form do |f|
		f.inputs do
			f.input :email

	      	f.has_many :departments, heading: false, allow_destroy: true, allow_create: true do |t|
	        	t.input :name_pt
	        	t.input :name_en
	        	t.input :name_es
	      	end
	    end
	    actions
	end
	# action_item :only => :show do
	#     link_to "Editar Contato" , edit_admin_company_path(1)
	#     link_to "Adicionar Departamento", new_admin_department_path()
	# end




end
