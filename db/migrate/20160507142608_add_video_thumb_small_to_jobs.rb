class AddVideoThumbSmallToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :video_thumb_small, :string
    add_column :jobs, :video_thumb_medium, :string
    add_column :jobs, :video_thumb_large, :string
  end
end
