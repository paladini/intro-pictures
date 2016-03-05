class AddTranslationToJobs < ActiveRecord::Migration
  def up

  	# Synopsis
  	rename_column :jobs, :synopsis, :synopsis_pt
  	add_column :jobs, :synopsis_es, :text
  	add_column :jobs, :synopsis_en, :text

  	# Format
  	rename_column :jobs, :format, :format_pt
  	add_column :jobs, :format_es, :text
  	add_column :jobs, :format_en, :text

  	# Genre
  	rename_column :jobs, :genre, :genre_pt
  	add_column :jobs, :genre_es, :text
  	add_column :jobs, :genre_en, :text

  	# Subgenre
  	rename_column :jobs, :subgenre, :subgenre_pt
  	add_column :jobs, :subgenre_es, :text
  	add_column :jobs, :subgenre_en, :text

  	# Running Time
  	rename_column :jobs, :running_time, :running_time_pt
  	add_column :jobs, :running_time_es, :text
  	add_column :jobs, :running_time_en, :text

  	# Target
  	rename_column :jobs, :target, :target_pt
  	add_column :jobs, :target_es, :text
  	add_column :jobs, :target_en, :text

  	# Create By
  	rename_column :jobs, :created_by, :created_by_pt
  	add_column :jobs, :created_by_es, :text
  	add_column :jobs, :created_by_en, :text

  	# Written By
  	rename_column :jobs, :written_by, :written_by_pt
  	add_column :jobs, :written_by_es, :text
  	add_column :jobs, :written_by_en, :text

  	# Directed By
  	rename_column :jobs, :directed_by, :directed_by_pt
  	add_column :jobs, :directed_by_es, :text
  	add_column :jobs, :directed_by_en, :text

  end

  def down
  	# Synopsis
  	rename_column :jobs, :synopsis_pt, :synopsis
  	remove_column :jobs, :synopsis_es, :text
  	remove_column :jobs, :synopsis_en, :text

  	# Format
  	rename_column :jobs, :format_pt, :format
  	remove_column :jobs, :format_es, :text
  	remove_column :jobs, :format_en, :text

  	# Genre
  	rename_column :jobs, :genre_pt, :genre
  	remove_column :jobs, :genre_es, :text
  	remove_column :jobs, :genre_en, :text

  	# Subgenre
  	rename_column :jobs, :subgenre_pt, :subgenre
  	remove_column :jobs, :subgenre_es, :text
  	remove_column :jobs, :subgenre_en, :text

  	# Running Time
  	rename_column :jobs, :running_time_pt, :running_time
  	remove_column :jobs, :running_time_es, :text
  	remove_column :jobs, :running_time_en, :text

  	# Target
  	rename_column :jobs, :target_pt, :target
  	remove_column :jobs, :target_es, :text
  	remove_column :jobs, :target_en, :text

  	# Create By
  	rename_column :jobs, :created_by_pt, :created_by
  	remove_column :jobs, :created_by_es, :text
  	remove_column :jobs, :created_by_en, :text

  	# Written By
  	rename_column :jobs, :written_by_pt, :written_by
  	remove_column :jobs, :written_by_es, :text
  	remove_column :jobs, :written_by_en, :text

  	# Directed By
  	rename_column :jobs, :directed_by_pt, :directed_by
  	remove_column :jobs, :directed_by_es, :text
  	remove_column :jobs, :directed_by_en, :text
  end
end
