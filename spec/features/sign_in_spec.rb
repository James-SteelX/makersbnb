require 'spec_helper'

feature 'signing in to MakersBnB' do
  scenario 'User signs in with valid account' do
    sign_up
    sign_out
    sign_in
    expect(page).to have_content "Welcome, Terry"
  end

  scenario 'User tries to sign in with incorrect password' do
    sign_up
    sign_out
    sign_in(password: 'obviously_wrong!')
    expect(page).to have_content "The email or password is incorrect"
  end

  scenario 'User tries to sign in with incorrect account' do
    sign_up
    sign_out
    sign_in(email: 'obviously_wrong@email.com')
    expect(page).to have_content "The email or password is incorrect"
  end
end
