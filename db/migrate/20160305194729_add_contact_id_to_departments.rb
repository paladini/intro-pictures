class AddContactIdToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :contact_id, :integer
    add_index :departments, :contact_id
  end
end
