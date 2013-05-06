class CategoriesController < ApplicationController

  layout 'admin'
  
  before_filter :confirm_logged_in
  
  def index
    list
    render('list')
  end
  
  def list
    @categories = Category.order("categories.position ASC")
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
    @category_count = Category.count + 1
  end
  
  def create
    new_position = params[:category].delete(:position)
    # Instantiate a new object using form parameters
    @category = Category.new(params[:category])
    # Save the object
    if @category.save
      @category.move_to_position(new_position)
      # If save succeeds, redirect to the list action
      flash[:notice] = "Category created."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      @category = Category.count + 1
      render('new')
    end
  end
  
  def edit
    @category = Category.find(params[:id])
    @category_count = Category.count
  end
  
  def update
    new_position = params[:category].delete(:position)
    # Find object using form parameters
    @category = Category.find(params[:id])
    # Update the object
    if @category.update_attributes(params[:category])
      @category.move_to_position(new_position)
      # If update succeeds, redirect to the list action
      flash[:notice] = "Category updated."
      redirect_to(:action => 'show', :id => @category.id)
    else
      # If save fails, redisplay the form so user can fix problems
      @category_count = Category.count
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
