class PublicController < ApplicationController
 
  layout 'public'
  
  before_filter :setup_navigation
  
  def index
    # intro text
    @categories = Category.all
    @songs = Song.find(:all)
  end

  def show
  end

  private
  
  def setup_navigation
  end
  
end
