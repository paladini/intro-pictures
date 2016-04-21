class RemoveContactEmailFromCompany < ActiveRecord::Migration
  def change
    remove_column :companies, :contact_email, :string
  end
end
