class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :get_song, :get_song_id, :get_category


  def get_song(cat)
    song = Song.find_by_category_id(cat)
    if song.blank?
      return ''
    else
      song.title
    end
  end

  def get_song_id(cat)
    # @songs = Song.where("category_id = ?", cat)
    Song.where("category_id = ?", cat)
  end

  def get_category(input)
    @category = Category.find(input)
    @category.name
  end


  protected
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_filter
    else
      return true
    end
  end
  
end
