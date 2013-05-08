class CommentsController < ApplicationController
  layout 'public'

	def new
		@comment = Comment.new(params[:comment])
	end

	def create
	    @comment = Comment.new(params[:comment])
	    if @comment.save 
	    	flash[:success] = "Comment successful"
	    	redirect_to song_path(params[:comment][:song_id])
	    else
	    	flash[:error] = "Comment not successful"
	    	redirect_to song_path(params[:comment][:song_id])
	  	end
	end

	def edit
	    @comment = Comment.find(params[:id])
	end

	def update
	    @comment = Comment.find(params[:id])
	    if @comment.update_attributes(params[:comment]) 
	    	flash[:success] = "Comment successful"
	    	redirect_to song_path(@comment.song_id)
	    else
	    	flash[:error] = "Comment not successful"
	    	redirect_to song_path(@comment.song_id)
	  	end 
	end

	def destroy
	    @comment = Comment.find(params[:id])
	    @comment.destroy
	    flash[:success] = "Comment successful"
	    redirect_to song_path(@comment.song_id)
	end
end
