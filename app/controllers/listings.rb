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
      Email.created_space(current_user.email, listing.city)
      erb :'listings/confirmation'
    else
      flash.keep[:errors] = ['Sorry, there was a problem when posting your listing. Please try again.']
      redirect('/listings/new')
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
    all_dates = Availability.all(:start_date.gte => params[:start_date], :end_date.lte => params[:end_date], :listing_id => params[:listing_id])
      if !all_dates.empty?
        flash.now[:notice] = "You already have an availability set for those dates"
        @listing_id = params[:listing_id]
        erb :'listings/add_date'
      elsif date.start_date > date.end_date
        flash.now[:notice] = "Please enter dates in correct order"
        @listing_id = params[:listing_id]
        erb :'listings/add_date'
      else
        Email.updated_date(current_user.email, params[:start_date], params[:end_date], date.listing.city)
        date.save
        redirect('/users/profile')
      end
   end
end
