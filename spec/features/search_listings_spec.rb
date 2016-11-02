require 'spec_helper'

feature 'Search listings' do
  scenario 'search listings to view' do
    sign_up
    create_listing
    search_listings
    expect(page).to have_content 'London'
    expect(page).to have_content '4 bed house with garden'
    expect(page).to have_content 'Price per night: 120'
    expect(current_path).to eq '/listings/results'
  end
end
