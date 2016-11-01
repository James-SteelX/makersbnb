class MakersBnB < Sinatra::Base

   get '/listings' do
    erb :'listings/listings'
   end


  get '/listing/new' do
   if current_user != nil
     erb :'listings/new'
   else
     flash.keep[:errors] = ['Please sign in to post a listing']
     redirect('/sessions/sign_in')
   end
  end

  post '/listing' do
    listing = Listing.new(street_address: params[:street_address], city: params[:city], description: params[:description], price: params[:price])
    user = current_user
    listing.user = user
    if listing.save
       redirect to('/listing/confirmation')
    else
      'sorry no good'
    end
  end

  get '/listing/confirmation' do
    erb :'listings/confirmation'
  end

end
