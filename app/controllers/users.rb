class MakersBnB < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/sign_up' do
    @user = User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                email: params[:email],
                mobile_number: params[:mobile_number],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash.keep[:notice] = "Welcome, #{@user.first_name}"
      redirect('/home')
      Email.sign_up(@user.email)
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/users/profile' do
    @profile = Profile.new(current_user)
    erb(:'/users/profile')
  end
end
