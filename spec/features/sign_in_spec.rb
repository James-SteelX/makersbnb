require 'spec_helper'
require_relative 'web_helpers'

feature 'signing in to MakersBnB' do
  scenario 'User signs in with valid account' do
    sign_up
    sign_out
    sign_in
    expect(page).to have_content "Welcome, Terry"
  end

  scenario 'User tries to sign in with invalid account' do
    sign_up
    sign_out
    sign_in_bad
    expect(page).to have_content "The email or password is incorrect"
  end
end
