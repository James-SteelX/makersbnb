require 'spec_helper'

feature 'signing out of MakersBnB' do
  scenario 'User signs out' do
    sign_up
    sign_out
    expect(page).to have_link('Sign In')
  end

  scenario 'User cant sign out without being signed in' do
    visit('/')
    expect(page).not_to have_button('Sign out')
  end
end
