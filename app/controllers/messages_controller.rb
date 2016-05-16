class MessagesController < ApplicationController
  
  	def new
  		@message = Message.new
 	end
 	
	def create
	    @message = Message.new(message_params)

	    if verify_recaptcha(model: @message) and @message.valid?
	      	MessageMailer.message_me(@message).deliver_now
	      	redirect_to root_path, notice: "Thank you for the message."
	      	# redirect_to new_message_path, notice: "Thank you for your message."
	    else
	    	# redirect_to root_path
	    	# flash[]
	    	# render root_path
	    	# render 'pages/home'
	      	render :new
	      	# flash = flash.now
	      	# flash[:error] = @message.errors.full_messages.to_sentence
	      	# redirect_to :back
	    end
  	end

  	private
	  	def message_params
	    	params.require(:message).permit(:name, :email, :subject, :content, :department, :file)
	  	end
end
