class MessageMailer < ApplicationMailer

	default :to => "fnpaladini@gmail.com"
	
	def message_me(msg)
    	@msg = msg
    	if !@msg.file.nil?
    		attachments[@msg.file.original_filename] = File.read(@msg.file.path)
    	end
    	mail(from: @msg.email, subject: @msg.subject, body: @msg.content)
  	end
end
