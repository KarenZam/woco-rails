class ContactsController < ApplicationController

  def create
    @email = params[ :email ]
    @subject = params[ :subject ]
    @body = params[ :body ]

    if Notifier.contact(@email, @subject, @body).deliver
      Notifier.contact_reply(@email).deliver
      render json: {
        contact: "Both mail delivered",
        valid: true
      }
    else
      Notifier.contact_reply_error(@email, @subject, @body).deliver
      render json: {
        contact: "There has been an error",
        valid: false
      }
    end

  end
  
end