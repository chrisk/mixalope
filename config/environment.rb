# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem "mysql",                :version => "2.7"
  config.gem "thoughtbot-paperclip", :version => "2.2.4",  :lib => "paperclip", :source => "http://gems.github.com"
  config.gem "rspec-rails",          :version => "1.1.12", :lib => false
  config.gem "capistrano",           :version => "2.5.4",  :lib => false
  config.gem "rack",                 :version => "0.9.1",  :lib => false

  config.frameworks -= [ :active_resource ]

  config.time_zone = 'UTC'
end