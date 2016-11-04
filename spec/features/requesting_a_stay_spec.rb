require 'spec_helper'

feature 'Search listings' do
  scenario 'requesting to stay at a location' do
    sign_up
    create_listing
    add_dates
    search_listings
    click_button('Make Booking Request')
    expect(current_path).to eq '/requests/request_booking'
    expect(page).to have_content 'Success - your request has been sent to the owner'
  end

  scenario 'specify the required dates of a stay' do
    sign_up
    create_listing
    search_listings
    expect{enter_dates}.to change(Request, :count).by(1)
    expect(current_path).to eq '/requests/request_booking'
    expect(page).to have_content 'Success - your request has been sent to the owner'
  end

  scenario 'cannot request a stay if not signed in' do
    sign_up
    create_listing
    enter_dates
    sign_out
    search_listings
    click_button 'Make Booking Request'
    expect(current_path).to eq '/sessions/sign_in'
    expect(page).to have_content 'Please sign in to request a stay'
  end

  scenario 'displays the status of a request' do
    sign_up
    create_listing
    search_listings
    enter_dates
    visit('/users/profile')
    expect(page).to have_content 'Location: London'
    expect(page).to have_content 'From: 2017-02-14 to 2017-02-16'
    expect(page).to have_content 'Status: For review'
  end

  scenario 'Tells user if they have no requests currently' do
    sign_up
    visit('/users/profile')
    expect(page).to have_content('You currently have no trips planned')
  end
end
