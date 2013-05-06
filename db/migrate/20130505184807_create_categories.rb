class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
    	t.string "name" #, :limit => 25
    	t.integer "position"
    	t.boolean "visible", :default => false
      	t.timestamps
    end
  end

  def self.down
  	drop_table :categories
  end
end
