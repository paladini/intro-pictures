class AddEmailToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :email, :string
  end
end
