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
    search_listings(city: 'Bath', listing_id: "")
    expect(current_path).to eq '/listings/results'
    expect(page).not_to have_content '4 bed house with garden'
    expect(page).not_to have_content 'Price per night: 120'
    expect(page).to have_content 'There are no results matching your search'
  end

  scenario 'searching by specific dates for a city returns only those options within those dates for that city ' do
    sign_up
    create_listing
    enter_available_dates
    enter_available_dates
    sign_out
    sign_up(first_name: 'George', last_name: 'Brown', email: 'jb@hotmail.com', password: 'password!', password_confirmation: 'password!')
    search_listings_with_dates(listing_id: "")
    expect(page).to have_content "2017-02-14 to 2017-02-16"
    expect(page).not_to have_content "2017-02-17 to 2017-02-18"
  end

  scenario 'searching by specific dates for a city returns multiple dates within the specified range' do
    sign_up
    create_listing
    enter_available_dates
    enter_available_dates(start_date: '17/02/2017', end_date: '18/02/2017')
    sign_out
    sign_up(first_name: 'George', last_name: 'Brown', email: 'jb@hotmail.com', password: 'password!', password_confirmation: 'password!')
    search_listings_with_dates(end_date: "18/02/2017", city: "")
    expect(page).to have_content "2017-02-14 to 2017-02-16"
    expect(page).to have_content "2017-02-17 to 2017-02-18"
  end

  scenario 'searching only by date returns all options within the specified range' do
    sign_up
    create_listing
    enter_available_dates
    sign_out
    sign_up(first_name: 'Shelley', last_name: 'Spaxman', email: 'ss@hotmail.com', password: 'cheese', password_confirmation: 'cheese')
    create_listing(city: 'Bristol')
    enter_available_dates
    sign_out
    sign_up(first_name: 'Bert', last_name: 'Frazer', email: 'bf@hotmail.com', password: 'ham', password_confirmation: 'ham')
    create_listing(city: 'Norwich')
    enter_available_dates(start_date: '15/02/2017', end_date: '17/02/2017' )
    sign_out
    search_listings_with_dates(city: "", listing_id: "")
    expect(page).to have_content "City: London Description: 4 bed house with garden Price per night: 120 Available dates: 2017-02-14 to 2017-02-16"
    expect(page).to have_content "City: London Description: 4 bed house with garden Price per night: 120 Available dates: 2017-02-14 to 2017-02-16"
    expect(page).to have_content "City: Norwich Description: 4 bed house with garden Price per night: 120 There are curently no dates that match your requirement"
  end
end
