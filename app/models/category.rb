class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name

  has_many :songs

  validates :name, presence: true
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
