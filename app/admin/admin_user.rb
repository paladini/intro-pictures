ActiveAdmin.register AdminUser, as: "administrador" do

  menu label: "Administradores"
  permit_params :email, :password, :password_confirmation

  index title: "Administradores" do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :created_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
