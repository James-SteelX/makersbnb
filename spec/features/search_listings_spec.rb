require 'spec_helper'

feature 'Search listings' do

  scenario 'search listings to view' do
    sign_up
    create_listing
    search_listings(listing_id: '')
    expect(current_path).to eq '/listings/results'
    expect(page).to have_content '4 bed house with garden'
    expect(page).to have_content 'Price per night: 120'
  end

  scenario 'search listings by a listings ID' do
    sign_up
    create_listing
    search_listings(city: '')
    expect(current_path).to eq '/listings/results'
    expect(page).to have_content '4 bed house with garden'
    expect(page).to have_content 'Price per night: 120'
  end

  scenario 'search won\'t bring anything up if listing doesnt exist' do
    sign_up
    create_listing
    search_listings(city: 'Bath', listing_id: 24)
    expect(current_path).to eq '/listings/results'
    expect(page).not_to have_content '4 bed house with garden'
    expect(page).not_to have_content 'Price per night: 120'
  end


end
