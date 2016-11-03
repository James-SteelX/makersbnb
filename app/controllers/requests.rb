
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
      flash.keep[:notice] = "Success - your booking has been sent to the owner"
      redirect to('/')
    else
      flash.keep[:notice] = 'Sorry your booking was not sent'
      redirect to('/listings/search_listings')
    end
  end

  post "/requests/accept_request" do
   request = Request.all(id: params[:request_id])
   date = Avdate.all(id: params[:date_id])

   request.update(:status => :accepted)
   date.update(:is_available => false)
   TextMessage.send(params[:requester_mobile], params[:city], params[:start_date], params[:requester_name])
   redirect('/')
  end

  post "/requests/reject_request" do
    request = Request.all(id: params[:request_id])
    request.update(:status => :rejected)
    redirect('/')
 end

end
