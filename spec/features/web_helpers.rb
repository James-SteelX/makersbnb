def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :first_name, with: 'Terry'
  fill_in :last_name, with: 'McGuire'
  fill_in :email,    with: 'terry@hotmail.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'oranges!'
  click_button 'Sign up'
end

def failed_sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :first_name, with: 'Terry'
  fill_in :last_name, with: 'McGuire'
  fill_in :email,    with: 'terry@hotmail.com'
  fill_in :password, with: 'oranges!'
  fill_in :password_confirmation, with: 'pears!'
  click_button 'Sign up'
end

def sign_out
  click_button('Sign out')
end

def sign_in
  visit('/')
  click_button('Sign in')
  fill_in :email,    with: 'terry@hotmail.com'
  fill_in :password, with: 'oranges!'
  click_button('Sign in')
end

def sign_in_bad
  visit('/')
  click_button('Sign in')
  fill_in :email,    with: 'obviously@wrong.com'
  fill_in :password, with: 'oranges!'
  click_button('Sign in')
end

def add_listing
  visit '/listings'
  click_button 'Add listing'
  fill_in :street_address, with: '24 Cherrytree Lane'
  fill_in :city, with: 'Cardiff'
  fill_in :description, with: 'Lovely two bed cottage: Sheep grazing in backyward'
  fill_in :price, with: '£75'
  click_button 'submit'
end

def search_listings
  visit '/listings'
  fill_in :city, with: 'Cardiff'
  click_button 'Search'
end
