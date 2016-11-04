module SessionHelpers
  def sign_up(first_name: 'Terry', last_name: 'McGuire', phone_number: '07123456789', email: 'terry@hotmail.com', password: 'oranges!', password_confirmation: 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name
    fill_in :mobile_number, with: phone_number
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  def sign_out
    click_button('Sign out')
  end

  def sign_in(email: 'terry@hotmail.com', password: 'oranges!')
    visit('/')
    click_link('Sign In')
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button('Sign In')
  end

  def create_2_user_accounts
    sign_up
    create_listing
    add_dates
    sign_out
    sign_up(first_name: 'George', last_name: 'Brown', email: 'jb@hotmail.com', password: 'password!', password_confirmation: 'password!')
  end

  def create_2_user_accounts_wthout_a_listing
    sign_up
    add_dates
    sign_out
    sign_up(first_name: 'George', last_name: 'Brown', email: 'jb@hotmail.com', password: 'password!', password_confirmation: 'password!')
  end

  def create_2_user_accounts_without_availability
    sign_up
    create_listing
    sign_out
    sign_up(first_name: 'George', last_name: 'Brown', email: 'jb@hotmail.com', password: 'password!', password_confirmation: 'password!')
  end

  def create_listing(street_address: '101 Street Street', city: 'London', description: '4 bed house with garden', price: 120)
    visit '/listings/new'
    fill_in :street_address, with: street_address
    fill_in :city, with: city
    fill_in :description, with: description
    fill_in :price, with: price
    click_button 'Create listing'
  end

  def search_listings(city: "London", listing_id: '1')
    click_link 'Search'
    fill_in :listing_id, with: listing_id
    fill_in :city, with: city
    click_button 'Search'
  end

  def search_listings_with_dates(city: "London", listing_id: '1', start_date: '14/02/2017', end_date: '16/02/2017')
    click_link 'Search'
    fill_in :listing_id, with: listing_id
    fill_in :city, with: city
    fill_in :start_date, with: start_date
    fill_in :end_date, with: end_date
    click_button 'Search'
  end

  def enter_available_dates(start_date: '14/02/2017', end_date: '16/02/2017')
    visit('/users/profile')
    click_button('Add dates')
    fill_in :start_date, with: start_date
    fill_in :end_date, with: end_date
    click_button('OK')
  end


  def enter_dates(start_date: '14/02/2017', end_date: '16/02/2017' )
    visit('/users/profile')
    click_button('Add dates')
    fill_in :start_date, with: start_date
    fill_in :end_date, with: end_date
    click_button('OK')
    visit('/listings')
    click_button 'Make Booking Request'
  end

  def enter_dates_without_requesting_it(start_date: '14/02/2017', end_date: '16/02/2017' )
    visit('/users/profile')
    click_button('Add dates')
    fill_in :start_date, with: start_date
    fill_in :end_date, with: end_date
    click_button('OK')
  end

  def enter_dates_in_the_past
    visit('/users/profile')
    click_button('Add dates')
    fill_in :start_date, with: '14/02/2016'
    fill_in :end_date, with: '16/02/2016'
    click_button('OK')
  end

  def add_dates
    visit('/users/profile')
    click_button('Add dates')
    fill_in :start_date, with: '14/02/2017'
    fill_in :end_date, with: '16/02/2017'
    click_button('OK')
  end

end
