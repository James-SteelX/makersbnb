require 'spec_helper'
require_relative 'web_helpers'

feature 'Listing a property on makersbnb' do
  scenario 'user can post a listing' do
    sign_up
    # sign_in
    click_link('List a property')
    expect(current_path).to eq('/listing/new')
    expect(page).to have_content('Create a property listing')
  end

end
