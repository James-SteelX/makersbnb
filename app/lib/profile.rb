class Profile

  attr_reader :available_dates, :user_listings, :requests_made, :requests_received, :accepted_requests_received

  def initialize(current_user)
    @available_dates = Availability.all(is_available: true)
    @user_listings = current_user.listings
    @requests_made = current_user.requests
    @requests_received = current_user.listings.requests(status: :for_review)
    @accepted_requests_received = current_user.listings.requests(status: :accepted, :end_date.gte => Time.now )
  end

end
