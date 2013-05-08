class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name

  has_many :songs

  validates :name, presence: true
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
  def self.search(search)
    search_condition =  "%#{search}%"
    find(:all, :conditions => ['name LIKE ?', search_condition])
  end
end
