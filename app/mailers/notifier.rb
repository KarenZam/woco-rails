class Notifier < ActionMailer::Base
  default from: "Women Who Code HK <womenwhocodehk@gmail.com>"

  def contact(email, subject, body)
    @body = body
    @email = email
    mail to: "womenwhocodehk@gmail.com", subject: subject
  end

  def contact_reply(email)
    puts "contact reply"
    @email = email

    mail to: @email, subject: "[Women Who Code HK] Thank you for contacting us"
  end

  def contact_reply_error(email, subject, body)
    @body = body
    @email = email
    @subject = subject
    mail to: "womenwhocodehk@gmail.com", subject: "error in contact form"
  end

end