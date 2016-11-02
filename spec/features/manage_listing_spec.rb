require 'spec_helper'

feature 'Managing all a user\'s listings' do
  scenario 'a user can view all of their listings' do
    sign_up
    create_listing
    create_listing(street_address: '102 Happy Street', city: 'London', description: '3 bed house with kitchen', price: 150)
    visit('/users/profile')
    expect(page).to have_content('101 Street Street')
    expect(page).to have_content('102 Happy Street')
  end
end
