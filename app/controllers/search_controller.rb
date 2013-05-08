class SearchController < ApplicationController
  layout 'public'

	def index
		unless (params[:search]).blank?
			@songs = Song.search(params[:search])
		end
  	end

	def show
	end
end
