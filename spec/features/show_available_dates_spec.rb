require 'spec_helper'

feature 'Show listings available dates' do
  scenario 'host selects avilable dates for property' do
   sign_up
   create_listing
   visit('/users/profile')
   click_link('Add dates')
   select '01/01/2016', :from => :start_date
   select '03/01/2016', :from => :end_date
   click_button('Ok')
   expect(current_path).to eq('/users/profile')
   expect(page).to have_content('Available from 01/01/2016 to 03/01/2016')
  end
end
