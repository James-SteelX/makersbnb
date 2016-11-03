require 'spec_helper'

feature 'Show listings available dates' do
  scenario 'host selects avilable dates for property' do
   sign_up
   create_listing
   visit('/users/profile')
   click_button('Add dates')
   expect(current_path).to eq('/listings/add_date')
   fill_in "start_date", with: "2016/01/01"
   fill_in "end_date", with: "2016/01/03"
   click_button('OK')
   expect(current_path).to eq('/users/profile')
   expect(page).to have_content('Availability: 2016-01-01 to 2016-01-03')
  end
end
