class MessagesController < ApplicationController
  
  	def new
  		@message = Message.new
 	end
 	# 
	def create
	    @message = Message.new(message_params)

	   	# if @message.valid?
	    if verify_recaptcha(model: @message) and @message.valid?

	    	# Get the correct e-mail
	    	mail_to = Department.find(@message.department).email

	    	# Deliver the email
	      	MessageMailer.message_me(@message, mail_to).deliver_now
	      	# redirect_to root_path, notice: "Thank you for the message."
	      	respond_to do |format|
			    format.html { render :new }
			    format.js { render 'new', notice: "Success" }
		    end
	    else
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
