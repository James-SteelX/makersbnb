class MakersBnB < Sinatra::Base

  get '/listings' do
    erb :'listings/listings'
  end

end
