require 'spec_helper'

feature 'Listing a property on makersbnb' do
  scenario 'a signed in user can visit listing page' do
    sign_up
    click_link('List a property')
    expect(current_path).to eq('/listings/new')
    expect(page).to have_content('Create a property listing')
  end

  scenario 'user can create a listing' do
    sign_up
    expect{create_listing}.to change(Listing, :count).by(1)
    expect(current_path).to eq('/listings')
    expect(page).to have_content('Your home has been successfully listed')
  end

  scenario 'you cant see the link if not logged in' do
    visit('/')
    expect(page).not_to have_content('List a property')
  end

  scenario 'you cant create a listing if not logged in' do
    visit('/listings/new')
    expect(current_path).to eq('/sessions/sign_in')
    expect(page).to have_content('Please sign in to post a listing')
  end

  scenario 'user can add dates to a listing' do
    sign_up
    create_listing
    click_button('Add dates')
    expect(page).to have_content('Add available dates to your property')
    fill_in :start_date, with: '14/02/2017'
    fill_in :end_date, with: '16/02/2017'
    expect{click_button('OK')}.to change(Availability, :count).by(1)
  end


end
