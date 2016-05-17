class MessageMailer < ApplicationMailer

	default :to => "contato@intropictures.tv"
	
	def message_me(msg, mail_to)
    	@msg = msg
    	if !@msg.file.nil?
    		attachments[@msg.file.original_filename] = File.read(@msg.file.path)
    	end
    	mail(from: @msg.email, to: mail_to, subject: @msg.subject, body: @msg.content)
  	end
end
