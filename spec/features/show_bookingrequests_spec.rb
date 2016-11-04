require 'spec_helper'

feature 'Show booking requests' do
  scenario 'Host can see the booking requests for a listing' do
   create_2_user_accounts
   create_listing
   enter_dates
   expect(page).to have_content('Request received from: George Brown')
 end

 scenario 'Host can see upcoming requests' do
   create_2_user_accounts
   sign_out
   sign_in(email: 'terry@hotmail.com', password: 'oranges!')
   enter_dates
   sign_out
   sign_in(email: 'jb@hotmail.com', password: 'password!')
   search_listings(city: "London", listing_id: '' )
   sign_out
   sign_in(email: 'terry@hotmail.com', password: 'oranges!')
   visit('users/profile')
   click_button("Accept")
   expect(page).to have_content("From: 2017-02-14 to 2017-02-16")
 end

 scenario 'Host cannot see request where end of stay is before today' do
   create_2_user_accounts
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
