class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :id
      t.string :category
      t.string :title
      t.string :artist
      t.string :album
      t.string :image
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
