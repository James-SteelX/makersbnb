class MakersBnB < Sinatra::Base

   get '/listings' do
    erb :'listings/listings'
   end


  get '/listings/new' do
   if current_user != nil
     erb :'listings/new'
   else
     flash.keep[:errors] = ['Please sign in to post a listing']
     redirect('/sessions/sign_in')
   end
  end

  post '/listings' do
    listing = Listing.new(street_address: params[:street_address], city: params[:city], description: params[:description], price: params[:price])
    user = current_user
    listing.user = user
    if listing.save
       redirect to('/listings/confirmation')
    else
      'sorry no good'
    end
  end

  get '/listings/confirmation' do
    erb :'listings/confirmation'
  end

  get '/listings/add_date' do
    erb :'listings/add_date'
  end

  post '/listings/add_date' do
    date = Avdate.new(start_date: params[:start_date], end_date: params[:end_date], is_available: true, listing_id: 1)
    date.save
    redirect('/users/profile')
  end

end
