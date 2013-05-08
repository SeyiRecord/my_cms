class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :category_id, :comments, :id, :image, :title, :link

  acts_as_commentable

  belongs_to :category

  validates_presence_of :category_id
  validates_presence_of :title
  validates_presence_of :album
  validates_presence_of :artist
  validates_presence_of :link
  validates_uniqueness_of :title
  validates_uniqueness_of :link
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

  def self.search(search)
    search_condition =  "%#{search}%"
    find(:all, :conditions => ['album LIKE ? OR artist LIKE ? OR title LIKE ?', search_condition, search_condition, search_condition])
  end
end
