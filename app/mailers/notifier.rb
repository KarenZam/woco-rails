class Notifier < ActionMailer::Base
  default from: "Women Who Code HK <hello@womenwhocodehk.com>"

  def contact(email, subject, body)
    @body = body
    @email = email
    subject = "[Women Who Code HK ADMIN] subject : " + subject
    mail to: "chleozam@gmail.com", subject: subject
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
    mail to: "chleozam@gmail.com", subject: "error in contact form"
  end

end