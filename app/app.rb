ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    'Hello World'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/sign_up' do
    user = User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/home' do
    erb :home
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
