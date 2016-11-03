require 'spec_helper'

feature 'Show booking requests' do
  scenario 'Host can see the booking requests for a listing' do
   create_2_user_accounts
   create_listing
   enter_dates
   expect(page).to have_content('Request received from: George Brown')
 end
end
