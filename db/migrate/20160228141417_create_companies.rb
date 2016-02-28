class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :summary_pt
      t.text :summary_en
      t.text :summary_es
      t.text :address_pt
      t.text :address_en
      t.text :address_es
      t.string :email
      t.string :telephone

      t.timestamps null: false
    end
  end
end
