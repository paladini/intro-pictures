class ChangeEmailTelephoneDataTypeInCompanies < ActiveRecord::Migration
  def up
    change_column :companies, :email, :text
    change_column :companies, :telephone, :text
  end

  def down
    change_column :companies, :email, :string
    change_column :companies, :telephone, :string
  end
end
