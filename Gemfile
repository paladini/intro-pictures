source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'

# Webserver
gem 'thin'

# Easily make HTTP requests
gem "http"

# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '~> 5.0'

# Meta tags
gem 'meta-tags'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Administrative portal
gem 'devise' # manage admin user
gem 'activeadmin', github: 'activeadmin' # manage administrative portal itself
gem 'active_skin' # awesome design

# Contact Form
gem 'mail_form'
gem "recaptcha", require: "recaptcha/rails" # captcha for anti-flood reasons
gem 'remotipart', '~> 1.2' # Needed by "remote: true" form submit with input[type='file']
gem 'mailgunner', '~> 2.4' # Integration with MailGun

# Models related
gem 'validates_email_format_of'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Gems available only in Production environment.
group :production do

  # Use PostgreSQL as the database for Active Record
	gem 'pg'
	gem 'rails_12factor'
end

# Gems available only in Development/Test environment.
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  gem 'railroady'
end

# Gems available only in Development environment.
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

