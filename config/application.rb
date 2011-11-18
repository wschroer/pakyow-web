require 'rubygems'
require 'bundler/setup'

require 'rubygems'
require 'coderay'
require 'rdiscount'

require 'pakyow'

require 'blog_engine'

# Production Configuration
if File.exists? '../shared/conf-production.rb'
  require '../shared/conf-production'
end

module PakyowApplication
  class Application < Pakyow::Application
    config.app.default_environment = :development
    
    configure(:development) do
    end
    
    routes do
      get '/',          :ApplicationController, :index
      get '/manual',    :ApplicationController, :manual
      get '/community', :ApplicationController, :community
      
      get '/posts' do
        BlogEngine.list
      end
      
      get BlogEngine.post_uri do
        BlogEngine.single
      end
      
      get '/feed' do
        BlogEngine.feed
      end
    end
  end
end
