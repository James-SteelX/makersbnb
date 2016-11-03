class MakersBnB < Sinatra::Base

  post '/requests/new' do
    @listing_id = params[:listing_id]
    if current_user != nil
      erb :'requests/new'
    else
      flash.keep[:errors] = ['Please sign in to request a stay']
      redirect('/sessions/sign_in')
    end
  end

  post '/requests/confirmation' do
    request = Request.new(start_date: params[:start_date],
                end_date: params[:end_date],
                listing_id: params[:listing_id],
                user_id: current_user.id)
    if request.save
      redirect to('/requests/confirmation')
    else
      'Sorry your message was not sent'
    end
  end

  get '/requests/confirmation' do
    erb :'requests/confirmation'
  end

  post '/requests/request_booking' do
    request = Request.new(start_date: params[:start_date],
                end_date: params[:end_date],
                listing_id: params[:listing_id],
                avdate_id:  params[:avdate_id],
                user_id: current_user.id)
    if request.save
      redirect to('/requests/confirmation')
    else
      'Sorry your message was not sent'
    end
    flash.keep[:notice] = "Success - your booking has been sent to the owner"
    erb :'requests/confirmation'
  end

end
