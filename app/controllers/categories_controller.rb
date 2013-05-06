class CategoriesController < ApplicationController

  layout 'admin'
  
  before_filter :confirm_logged_in
  
  def index
    @categories = Category.find(:all)
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Your Category has been successfuly created."
      redirect_to root_path
    else
      flash[:error] = "Could not be created."
      render('new')
    end
  end
  
  def edit
    @category = Category.find(params[:id])
    @category_count = Category.count
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Category updated."
      # redirect_to(:action => 'show', :id => @category.id)
      redirect_to root_path
    else
      flash[:error] = "Update failed."
      render('edit')
    end
  end
  
  def delete
    @category = Category.find(params[:id])
  end
  
  def destroy
    category = Category.find(params[:id])
    category.move_to_position(nil)
    category.destroy
    flash[:notice] = "Category destroyed."
    redirect_to(:action => 'list')
  end
  
end
