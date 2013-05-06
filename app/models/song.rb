class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :category, :comments, :id, :image, :title

  belongs_to :category

  validates_presence_of :title
  
end
