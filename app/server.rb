require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/flash'

class MakersBnB < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def reject_requests(request)
      rejected = Request.all(availability_id: params[:date_id])
      rejected.update(:status => :rejected)
      request.update(:status => :accepted)
    end

  end


end
