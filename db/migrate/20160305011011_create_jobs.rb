class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :url
      t.string :title_pt
      t.string :title_es
      t.string :title_en
      t.string :password
      t.text :synopsis
      t.text :format
      t.text :genre
      t.text :subgenre
      t.text :running_time
      t.text :target
      t.text :created_by
      t.text :written_by
      t.text :directed_by
      t.text :status
      t.text :player

      t.timestamps null: false
    end
  end
end
