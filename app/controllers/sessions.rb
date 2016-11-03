class MakersBnB < Sinatra::Base

  get '/sessions/sign_in' do
      erb :'sessions/sign_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash.keep[:notice] = "Welcome, #{user.first_name}"
      redirect :'/home'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/sign_in'
    end
  end


  delete '/sessions' do
    session[:user_id] = nil
    session[:nickname] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect :'/home'
  end
end
