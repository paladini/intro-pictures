class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name_pt
      t.string :name_en
      t.string :name_es

      t.timestamps null: false
    end
  end
end
