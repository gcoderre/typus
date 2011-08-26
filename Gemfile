source 'http://rubygems.org'

# Declare your gem's dependencies in typus.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

# Database adapters
platforms :jruby do
  gem 'activerecord-jdbcmysql-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'activerecord-jdbcsqlite3-adapter'

  gem 'jruby-openssl' # JRuby limited openssl loaded. http://jruby.org/openssl
end

platforms :ruby do
  gem 'mysql2'
  gem 'pg'
  gem 'sqlite3'
end

# And this stuff needed for the demo application.
gem "acts_as_list"
gem "acts_as_tree"
gem "factory_girl_rails", "~> 1.1.0"
gem "rails-permalink", "~> 1.0.0"
gem "rails-trash", "~> 1.1.2"

# For some reason I also need to define the `jquery-rails` gem here.
gem "jquery-rails"

# Rich Text Editor
gem "ckeditor-rails", "0.0.2"

# Alternative authentication
gem "devise", "~> 1.4.2"

# Asset Management with Dragonfly
gem "dragonfly", "~> 0.9"
gem "rack-cache", :require => "rack/cache"

# Asset Management with Paperclip
gem "paperclip", "~> 2.3.16"

# MongoDB
gem "mongoid", "~> 2.1"
gem "bson_ext", "~> 1.3"

group :test do
  gem "shoulda-context", "~> 1.0.0.beta1"
  gem "mocha" # Make sure mocha is loaded at the end ...
end
