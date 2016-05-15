class AddYearToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :year, :string
  end
end
