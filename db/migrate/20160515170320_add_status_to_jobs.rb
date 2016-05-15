class AddStatusToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :status_en, :string
    add_column :jobs, :status_pt, :string
    add_column :jobs, :status_es, :string
  end
end
