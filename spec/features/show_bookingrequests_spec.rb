require 'spec_helper'

feature 'Show booking requests' do
  scenario 'Host can see the booking requests for a listing' do
   create_2_user_accounts
   search_listings
   expect(current_path).to eq('/listings')
   click_button('Make Booking Request')
   sign_out
   sign_in
   visit('/users/profile')
   expect(page).to have_content('Request received from: George Brown')
 end
end
