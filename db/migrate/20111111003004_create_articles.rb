class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      
      t.string :media_file_name
      t.string :media_content_type
      t.integer :media_file_size
      t.datetime :media_updated_at

      t.timestamps
    end
  end
end
