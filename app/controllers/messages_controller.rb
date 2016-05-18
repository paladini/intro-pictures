class MessagesController < ApplicationController
  
  	def new
  		@message = Message.new
 	end
 	# 
	def create
	    @message = Message.new(message_params)

	    # if true
	    if verify_recaptcha(model: @message) and @message.valid?

	    	# Get the correct e-mail
	    	mail_to = Department.find(@message.department).email

	    	# Deliver the email
	      	MessageMailer.message_me(@message, mail_to).deliver_now

      		respond_to do |format|
			    format.html { redirect_to root_path }
			    format.js {
			    	flash.now[:success] = true
			    	render :new
			    }
		    end
	    else
	    	puts @message.errors.full_messages
	      	respond_to do |format|
		    	format.js { render :new }
		        format.json { render json: @message.errors, status: :unprocessable_entity }
		    end
	    end
  	end

  	private
	  	def message_params
	    	params.require(:message).permit(:name, :email, :subject, :content, :department, :file)
	  	end
end
