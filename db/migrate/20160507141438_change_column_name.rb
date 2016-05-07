class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :jobs, :url, :video_url
  end
end
