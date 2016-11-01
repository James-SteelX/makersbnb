class MakersBnB < Sinatra::Base

  get '/requests/new' do
    erb :'requests/new'
  end

  post '/requests/confirmation' do
    erb :'requests/confirmation'
  end
end
