class MessagesController < ApplicationController
  
  	def new
  		@message = Message.new
  		@departments = Department.all
 	end
 	
	def create
	    @message = Message.new(message_params)

	    if verify_recaptcha(model: @message) && @message.valid?
	      	MessageMailer.message_me(@message).deliver_now
	      	redirect_to new_message_path, notice: "Thank you for your message."
	    else
	      	render :new
	    end
  	end

  	private
	  	def message_params
	    	params.require(:message).permit(:name, :email, :subject, :content, :department, :file)
	  	end
end
