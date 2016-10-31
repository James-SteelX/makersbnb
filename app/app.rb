require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

ENV['RACK_ENV'] = 'development'

class MakersBnB < Sinatra::Base

  get '/' do
    'Hello World'
  end

end
