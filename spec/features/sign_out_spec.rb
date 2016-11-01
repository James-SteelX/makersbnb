require 'spec_helper'
require_relative 'web_helpers'

feature 'signing out of MakersBnB' do
  scenario 'User signs out' do
    sign_up
    sign_out
    expect(page).to have_button('Sign in')
  end

  scenario 'User cant sign out without being signed in' do
    visit('/')
    expect(page).not_to have_button('Sign out')
  end
end
