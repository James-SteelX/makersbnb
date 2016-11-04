ENV['RACK_ENV'] ||= 'development'

require 'pony'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './app/data_mapper_setup'
require_relative 'server'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/search_listing'
require_relative 'controllers/listings'
require_relative 'controllers/requests'
require_relative 'controllers/requests'
require_relative 'lib/send_text'
require_relative 'lib/profile'
require_relative 'lib/email'


class MakersBnB < Sinatra::Base

  get '/' do
    redirect('/home')
  end

  get '/home' do
    erb :'/home'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
