class AddVideoIdColumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :video_id, :integer
  end
end
