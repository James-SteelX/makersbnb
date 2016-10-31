require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

ENV['RACK_ENV'] = 'development'

class MakersBnB < Sinatra::Base

  get '/' do
    'Hello World'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
