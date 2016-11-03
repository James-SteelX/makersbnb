require 'spec_helper'

feature 'Show booking requests' do
  scenario 'Host can see the booking requests for a listing' do
   create_2_user_accounts
   visit '/listings'
   enter_dates
   visit '/users/profile'
  expect(page).to have_content('Request received from: George Brown')
 end
end
