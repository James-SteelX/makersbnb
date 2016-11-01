class MakersBnB < Sinatra::Base

  get '/listing/new' do
    erb :'listing/new'
  end

end
