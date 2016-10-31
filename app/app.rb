ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/models/user'
require './app/data_mapper_setup'


class MakersBnB < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    'Hello World'
  end

  get '/home' do
    erb :'/home'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/sign_up' do
    @user = User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      p "Password and confirmation do not match"
      erb :'/users/new'
    end
  end


  get '/sessions/sign_in' do
      erb :'sessions/sign_in'
    end

    post '/sessions' do
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/home'
      else
        flash.now[:errors] = ['The email or password is incorrect']
        erb :'/home'
      end
    end

    delete '/sessions' do
      session[:user_id] = nil
      session[:nickname] = nil
      flash.keep[:notice] = "Goodbye!"
      redirect '/home'
    end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
