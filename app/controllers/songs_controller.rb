class SongsController < ApplicationController

  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :find_page
  
  def index
    # list
    # render('list')
  end
  
  # def list
  #   @songs = Song.sorted.where(:page_id => @page.id)
  # end
  
  def show
    @song = Song.find(params[:id])
  end
  
  def new
    @song = Song.new(params[:song])
  end
  
  def create
    @song = Song.new(params[:song])
    if @song.save
      flash[:notice] = "Song created."
      redirect_to root_path
    else
      flash[:error] = "Song not created."
      render('new')
    end
  end
  
  def edit
    @song = Song.find(params[:id])
  end
  
  def update
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
    redirect_to(:action => 'list', :page_id => @page.id)
  end

  private
  
  def find_page
    if params[:page_id]
      @page = Page.find_by_id(params[:page_id])
    end
  end
  
end
