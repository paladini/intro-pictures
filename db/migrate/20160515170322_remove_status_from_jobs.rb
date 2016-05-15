class RemoveStatusFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :status, :string
  end
end
