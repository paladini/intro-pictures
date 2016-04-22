# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.public_key  = '6LfNehkTAAAAAFnBKHRls1FBHRP-YxdtMg5_IATt'
  config.private_key = '6LfNehkTAAAAAJUoHpYghMLtGC1c-EjHRHwDTZZx'
  config.api_version = 'v2'
end