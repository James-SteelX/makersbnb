class MakersBnB < Sinatra::Base

   get '/listings' do
    @all_listings = Listing.all
    @available_dates = Avdate.all(is_available: true)
    erb :'listings/listings'
   end

  get '/listings/new' do
   if current_user
     erb :'listings/new'
   else
     flash.keep[:errors] = ['Please sign in to post a listing']
     redirect('/sessions/sign_in')
   end
  end

  post '/listings' do
    listing = Listing.new(street_address: params[:street_address], city: params[:city], description: params[:description], price: params[:price])
    listing.user = current_user
    if listing.save
      # @listing_id = params[listing.id]
      erb :'listings/confirmation'
    else
      'sorry no good'
    end
  end

  # post '/listings/confirmation' do
  #   @listing_id = params[:listing_id]
  #   erb :'listings/confirmation'
  # end

  post '/listings/add_date' do
    @listing_id = params[:listing_id]
    erb :'listings/add_date'
  end

  post '/listings/set_dates' do
    date = Avdate.new(start_date: params[:start_date], end_date: params[:end_date], is_available: true, listing_id: params[:listing_id])
    date.save
    redirect('/users/profile')
  end
end
