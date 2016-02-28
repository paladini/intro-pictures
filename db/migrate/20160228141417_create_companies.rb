class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :resumo_pt
      t.text :resumo_en
      t.text :resumo_es
      t.text :endereco_pt
      t.text :endereco_en
      t.text :endereco_es
      t.string :email
      t.string :telefone

      t.timestamps null: false
    end
  end
end
