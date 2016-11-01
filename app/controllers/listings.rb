class MakersBnB < Sinatra::Base

  get '/listing/new' do
    erb :'listing/new'
  end

  post '/listing' do
    listing = Listing.new(street_address: params[:street_address], city: params[:city], description: params[:description], price: params[:price])
    user = current_user
    listing.user = user
    listing.save
    redirect to('/listing/confirmation')
  end

  get '/listing/confirmation' do
    erb :'listing/confirmation'
  end

end
