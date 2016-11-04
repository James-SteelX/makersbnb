require 'spec_helper'

feature 'Show booking requests' do
  scenario 'Host can see the booking requests for a listing' do
   create_2_user_accounts # terry signup, created listing, add dates, signed out. geroge signs in
   search_listings
   expect(current_path).to eq('/listings/results')
   click_button('Make Booking Request')
   sign_out
   sign_in
   visit('/users/profile')
   expect(page).to have_content('Request received from: George Brown')
 end

 scenario 'Host can see upcoming requests' do
   create_2_user_accounts
   search_listings  #  sign_in(email: 'terry@hotmail.com', password: 'oranges!')
   click_button('Make Booking Request')
   sign_out
   sign_in
   visit('users/profile')
   click_button("Accept")
   expect(page).to have_content("From: 2017-02-14 to 2017-02-16")
 end

 scenario 'Host cannot see request where end of stay is before today' do
   create_2_user_accounts_without_availability
   sign_out
   sign_in(email: 'terry@hotmail.com', password: 'oranges!')
   enter_dates_in_the_past
   sign_out
   sign_in(email: 'jb@hotmail.com', password: 'password!')
   search_listings(city: "London", listing_id: '' )
   sign_out
   sign_in(email: 'terry@hotmail.com', password: 'oranges!')
   visit('users/profile')
   click_button("Accept")
   expect(page).to have_content("You have no accepted bookings")
 end


end
