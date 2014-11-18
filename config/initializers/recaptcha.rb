Recaptcha.configure do |config|
  config.public_key  = ENV["RECAPTCHA_PUBLIC_KEY"]
  config.private_key = ENV["RECAPTCHA_PRIVATE_KEY"]
  config.proxy = 'http://localhost:3000'
end
