ActiveAdmin.register Department do

	menu label: "Departamentos" , priority: 5
	permit_params :name_pt, :name_es, :name_en

	before_save do |obj|
		if !obj.valid?
			flash[:error] = "Dados não atualizados! Algum campo não foi preenchido corretamente."
	    end
	end

	#
	# Label-related stuff
	#
	filter :name_pt
	filter :name_en
	filter :name_es

	index :title => "Departamentos" do
		column :name_pt
		column :name_en
		column :name_es
		actions
	end

	# Custom form for translated labels
	form do |f|
	    inputs do
		    input :name_pt
			input :name_en
			input :name_es
	    end
	    actions
	end

	# Custom show page for translated labels
	show do
	    attributes_table do
	    	row :id
	      	row :name_pt
			row :name_en
			row :name_es
	      	row :created_at 
	      	row :updated_at
	    end
	end

end
