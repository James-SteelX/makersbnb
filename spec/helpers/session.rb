module SessionHelpers
  def sign_up(first_name: 'Terry', last_name: 'McGuire', email: 'terry@hotmail.com', password: 'oranges!', password_confirmation: 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_out
    click_button('Sign out')
  end

  def sign_in(email: 'terry@hotmail.com', password: 'oranges!')
    visit('/')
    click_button('Sign in')
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button('Sign in')
  end

  def create_listing(street_address: '101 Street Street', city: 'London', description: '4 bed house with garden', price: 120)
    visit '/listings/new'
    fill_in :street_address, with: street_address
    fill_in :city, with: city
    fill_in :description, with: description
    fill_in :price, with: price
    click_button 'Create listing'
  end

  def search_listings(city: "London", listing_id: '1' )
    visit '/listings'
    click_button 'Search listings'
    fill_in :listing_id, with: listing_id
    fill_in :city, with: city
    click_button 'Search'
  end

  def enter_dates
    click_button 'Request stay'
    fill_in :start_date, with: '14/02/2017'
    fill_in :end_date, with: '16/02/2017'
    click_button 'Make request'
  end

end
