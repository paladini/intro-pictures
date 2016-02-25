class CreateEmployees < ActiveRecord::Migration
  def up
    create_table :employees do |t|
      t.string :name
      t.string :role_pt
      t.string :role_en
      t.string :role_es

      t.timestamps null: false
    end
  end

  def down
    drop_table :employees
  end
end
