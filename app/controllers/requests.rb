class MakersBnB < Sinatra::Base

  post '/requests/new' do
    p @listing_id = params[:listing_id]
    erb :'requests/new'
  end

  post '/requests/confirmation' do
    request = Request.new(start_date: params[:start_date],
    end_date: params[:end_date])

    #  listing = Listing.first(id: params[:listing_id])
    listing = Listing.first(id: 3)
    request.listing = listing
    if request.save
      redirect to('/requests/confirmation')
    else
      'Sorry your message was not sent'
    end
  end

  get '/requests/confirmation' do
    erb :'requests/confirmation'
  end

end
