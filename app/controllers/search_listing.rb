class MakersBnB < Sinatra::Base

  get '/listings/search_listings' do
    erb :'/listings/search_listings'
  end

  get '/listings/results' do
    @search_results = Listing.all(city: params[:city])
    erb :'/listings/results'
  end

end
