class ContactsController < ApplicationController

  def create
    puts "HELLLLLLLO"
    @email = params[:email]
    @subject = params[:subject]
    @body = params[:body]
    puts @email

    if Notifier.contact(@email, @subject, @body).deliver
      Notifier.contact_reply(@email).deliver
    else
      render json: {
        contact: "Sorry, there was an error sending your contact. Please try again later.",
        valid: false
      }
    end
    
  end

  
end