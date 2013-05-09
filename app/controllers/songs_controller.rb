class SongsController < ApplicationController
  layout 'public'

  before_filter :confirm_logged_in

  skip_before_filter :confirm_logged_in, :only => [:show, :destroy] #bad things happen
  
  def index
    @songs = Song.find(:all)
    @categories = Category.all
  end
  
  def show
    @categories = Category.all
    @song = Song.find(params[:id])
    @comment = Comment.new(params[:comment])
    @comments = Comment.where("song_id = ?", params[:id])

  end
  
  def new
    @categories = Category.all
    @song = Song.new
  end
  
  def create
    @song = Song.new(params[:song])
    if @song.save
      flash[:notice] = "Song created."
      #redirect_to root_path
      redirect_to Song.new
    else
      flash[:error] = "Song not created."
      render('new')
    end
  end
  
  def edit
    @categories = Category.all
    @song = Song.find(params[:id])
  end
  
  def update
    @categories = Category.all
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      flash[:notice] = "Song updated."
      redirect_to root_path
    else
      flash[:error] = "Song not updated."
      render('edit')
    end
  end
  
  def delete
    @song = Song.find(params[:id])
  end
  
  def destroy
    song = Song.find(params[:id])
    song.destroy
    flash[:notice] = "Song destroyed."
    redirect_to root_path
  end

end
