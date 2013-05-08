class AddIndexCategoryIdToSongs < ActiveRecord::Migration
  def change
  	add_index(:songs, :category_id)
  end
end
