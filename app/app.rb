ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require './app/models/user'
# require_relative 'data_mapper_setup'
require './app/data_mapper_setup'

class MakersBnB < Sinatra::Base

  get '/' do
    'Hello World'
  end

  get '/home' do
    "Hello home world!!!"
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/sign_up' do
    User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    redirect '/home'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
