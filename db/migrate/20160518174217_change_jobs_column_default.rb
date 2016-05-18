class ChangeJobsColumnDefault < ActiveRecord::Migration
  def change
  	change_column_default :jobs, :category_id, 1
  end
end
