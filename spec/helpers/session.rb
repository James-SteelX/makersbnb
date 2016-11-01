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

  def create_listing
    visit '/listings/new'
    fill_in :street_address, with: '101 Street Street'
    fill_in :city, with: 'London'
    fill_in :description, with: '4 bed house with garden'
    fill_in :price, with: '120'
    click_button 'Create listing'
  end

  def search_listings
    visit '/listings'
    click_button 'Search listings'
    fill_in :city, with: 'London'
    click_button 'Search'
  end
end
