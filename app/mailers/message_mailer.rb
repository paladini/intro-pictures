class MessageMailer < ApplicationMailer

	default :to => "fnpaladini@gmail.com"
	
	def message_me(msg)
    	@msg = msg
    	attachments[@msg.file.original_filename] = File.read(@msg.file.path)
    	mail(from: @msg.email, subject: @msg.subject, body: @msg.content)
  	end
end
