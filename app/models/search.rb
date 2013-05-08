class Search < ActiveRecord::Base
	def self.search(search, page)
		search_condition =  "%#{search}%"
		# find(:all, :conditions => ['value LIKE ?', search_condition])
	end
end
