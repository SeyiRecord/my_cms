class AdminUsersController < ApplicationController

	layout 'admin'
    before_filter :confirm_logged_in
  	
    skip_before_filter :confirm_logged_in, :only => :destroy

  	def index
  		list
    	render('list')
  	end

  def list
  	@admin_users = AdminUser.sorted
  end

  def new
  	@admin_user = AdminUser.new
  end

  def create
  	@admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      flash[:notice] = 'Admin user created.'
      redirect_to admin_users_path
    else
      render("new")
    end
  end

  def edit
  	@admin_user = AdminUser.find(params[:id])
  end

  def update
  	@admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(params[:admin_user])
      flash[:notice] = 'Admin user updated.'
      redirect_to admin_users_path
    else
      render("edit")
    end
  end

  def delete
  	@admin_user = AdminUser.find(params[:id])
  end

  def destroy
    admin_user = AdminUser.find(params[:id])
    admin_user.destroy
    flash[:notice] = "Admin user destroyed."
    redirect_to admin_users_path
  end

end
