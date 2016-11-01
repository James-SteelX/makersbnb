def create_listing
  visit '/listing/new'
  fill_in :street_address, with: '101 Street Street'
  fill_in :city, with: 'London'
  fill_in :description, with: '4 bed house with garden'
  fill_in :price, with: '120'
  click_button 'Create listing'
end
