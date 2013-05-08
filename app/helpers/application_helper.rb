module ApplicationHelper
	def status_tag(boolean, options={})
		options[:true]			||=''
		options[:true_class]	||='status true'
		options[:false]			||=''
		options[:false_class]	||='status false'

		if boolean
			content_tag(:span, options[:true], :class => options[:true_class])
		else
			content_tag(:span, options[:false], :class => options[:false_class])	
		end
	end	
	def error_messages_for( object )
    	render(:partial => 'shared/error_messages', :locals => {:object => object})
  	end

  	def youtube_video_link(input)
  		if !input.blank?		
	  		result = input.split("?v=")
	  		check_result = result[1].split("&")
	  		check_result[0]
  		else
  			content_tag(:p, "Your link is not valid")
  		end
  	end

  	def admin
  		!session[:username].blank?
  	end
end
