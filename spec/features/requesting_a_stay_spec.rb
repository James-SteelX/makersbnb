require 'spec_helper'

feature 'Search listings' do
  scenario 'requesting to stay at a location' do
    sign_up
    create_listing
    search_listings
    first('#listings').click_button('Request stay')
    expect(current_path).to eq '/requests/new'
    expect(page).to have_content 'Enter your desired start and end dates'
  end

  scenario 'specify the required dates of a stay' do
    sign_up
    create_listing
    search_listings
    expect{enter_dates}.to change(Request, :count).by(1)
    expect(current_path).to eq '/requests/confirmation'
    expect(page).to have_content 'Your request has been sent to the host'
  end

  scenario 'cannot request a stay if not signed in' do
    sign_up
    create_listing
    sign_out
    search_listings
    click_button 'Request stay'
    expect(current_path).to eq '/sessions/sign_in'
    expect(page).to have_content 'Please sign in to request a stay'
  end
end
