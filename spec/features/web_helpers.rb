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
