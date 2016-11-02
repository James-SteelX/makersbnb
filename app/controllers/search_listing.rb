class MakersBnB < Sinatra::Base

  get '/listings/search_listings' do
    erb :'/listings/search_listings'
  end

  get '/listings/results' do
    @city = params[:city]
    @all_listings = Listing.all(city: params[:city])
    @available_dates = Avdate.all(is_available: true)
    erb :'/listings/listings'
  end

end
