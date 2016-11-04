class MakersBnB < Sinatra::Base

  get '/listings/search_listings' do
    erb :'/listings/search_listings'
  end

  get '/listings/results' do
    if params[:listing_id].empty?
      @results = params[:city]
      @available_dates = Availability.all(is_available: true)
      @all_listings = Listing.all(city: params[:city])

    elsif params[:city].empty?
      @results = params[:listing_id]
      @available_dates = Availability.all(is_available: true)
      @all_listings = Listing.all(id: params[:listing_id])
    else
      @results = "#{params[:city]} and #{params[:listing_id]}"
      @available_dates = Availability.all(is_available: true)
      @all_listings = Listing.all(id: params[:listing_id], city: params[:city])
    end
    erb :'/listings/listings'
  end

end
