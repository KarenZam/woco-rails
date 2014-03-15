class Notifier < ActionMailer::Base
  default from: "Women Who Code HK <womenwhocodehk@gmail.com>"

  def contact(email, subject, body)
    @body = body
    mail to: "womenwhocodehk@gmail.com", from: email, subject: subject
  end

  def contact_reply(email)
    
    @email = email

    mail to: @email, subject: "[Women Who Code HK] Thank you for contacting us"
  end
end