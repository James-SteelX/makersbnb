feature 'Search listings' do
  scenario 'search listings to view' do
    sign_up
    create_listing
    search_listings
    expect(page).to have_content 'Listings for Cardiff'
    expect(current_path).to 'listings/cardiff'
    expect(page).to have_content 'Lovely two bed cottage: Sheep grazing in backyward'
    expect(page).to have_content 'Price per night: £75'
  end

  scenario 'requesting to stay at a location' do
    sign_up
    create_listing
    search_listings
    first('.listings').click_button('Request')
    expect(page).to have_content 'Your request has been sent to the host'
  end
end
