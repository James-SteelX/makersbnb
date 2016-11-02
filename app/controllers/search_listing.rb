class MakersBnB < Sinatra::Base

  get '/listings/search_listings' do
    erb :'/listings/search_listings'
  end

  get '/listings/results' do
    if params[:listing_id].empty?
      @results = params[:city]
      @search_results = Listing.all(city: params[:city])
    elsif params[:city].empty?
      @results = params[:listing_id]
      @search_results = Listing.all(id: params[:listing_id])
    else
      @results = "#{params[:city]} and #{params[:listing_id]}"
      @search_results = Listing.all(id: params[:listing_id], city: params[:city])
    end
    erb :'/listings/results'
  end

end
