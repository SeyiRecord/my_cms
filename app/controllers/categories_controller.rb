class CategoriesController < ApplicationController

  layout 'admin'

  before_filter :confirm_logged_in

  skip_before_filter :confirm_logged_in, :only => [:destroy] #bad things may happen

  def index
    @categories = Category.find(:all)
  end
  
  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @songs = Song.where("category_id = ?", params[:id])
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Your Category has been successfuly created."
      redirect_to Category.new
    else
      flash[:error] = "Could not be created."
      render('new')
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:success] = "Category updated."
      redirect_to(:action => 'index')
    else
      flash[:error] = "Update failed."
      render('edit')
    end
  end
  
  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category destroyed."
    redirect_to 
  end
  
end
