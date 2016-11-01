require 'spec_helper'

feature 'Search listings' do
  scenario 'search listings to view' do
    sign_up
    create_listing
    search_listings
    expect(page).to have_content 'Search results for London'
    expect(current_path).to eq '/listings/results'
    expect(page).to have_content '4 bed house with garden'
    expect(page).to have_content 'Price per night: 120'
  end

  # scenario 'requesting to stay at a location' do
  #   sign_up
  #   create_listing
  #   search_listings
  #   # first('.listings').click_button('Request')
  #   # expect(page).to have_content 'Your request has been sent to the host'
  # end
end
