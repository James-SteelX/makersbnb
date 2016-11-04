class MakersBnB < Sinatra::Base

  get '/listings/search_listings' do
    erb :'/listings/search_listings'
  end

  get '/listings/results' do
    if params[:city].empty? && params[:listing_id].empty?
      @all_listings = Listing.all
    elsif params[:city].empty? && params[:listing_id]
      @all_listings = Listing.all(id: params[:listing_id])
    elsif params[:listing_id].empty? && params[:city]
      @all_listings = Listing.all(city: params[:city])
    end

    unless params[:start_date].empty? && params[:end_date].empty?
      @available_dates = Availability.all(:start_date.gte => params[:start_date], :end_date.lte => params[:end_date], is_available: true)
    else
      @available_dates = Availability.all(is_available: true)
    end
    erb :'/listings/listings'
  end

end
