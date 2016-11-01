require 'spec_helper'
require_relative 'web_helpers'
require_relative 'listing_web_helpers'

feature 'Listing a property on makersbnb' do
  scenario 'a signed in user can visit listing page' do
    sign_up
    # sign_in
    click_link('List a property')
    expect(current_path).to eq('/listing/new')
    expect(page).to have_content('Create a property listing')
  end

  scenario 'user can create a listing' do
    sign_up
    create_listing
    expect(current_path).to eq('/listing/confirmation')
    expect(page).to have_content('Your home has been successfully listed')
  end



end
