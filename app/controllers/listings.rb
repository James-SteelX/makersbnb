class MakersBnB < Sinatra::Base

   get '/listings' do
    @all_listings = Listing.all
    @available_dates = Availability.all(is_available: true)
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
       listing.id
      @lastest_user_listing = Listing.all(id: listing.id)
      erb :'listings/confirmation'
    else
      'sorry no good'
    end
  end

  get '/listings/confirmation' do
    @lastest_user_listing = Listing.last
    erb :'listings/confirmation'
  end

  post '/listings/add_date' do
    @listing_id = params[:listing_id]
    erb :'listings/add_date'
  end

  post '/listings/set_dates' do
    date = Availability.new(start_date: params[:start_date], end_date: params[:end_date], is_available: true, listing_id: params[:listing_id])
    if date.start_date > date.end_date
      flash.now[:notice] = "Please enter dates in correct order"
      @listing_id = params[:listing_id]
      erb :'listings/add_date'
    else
      date.save
      redirect('/users/profile')
    end
  end
end
