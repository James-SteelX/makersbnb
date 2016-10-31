require 'spec_helper'
require_relative 'web_helpers'

feature 'signing up to MakersBnB' do
  scenario 'allow users to create a MakersBnB account' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq "/home"
    expect(page).to have_content "Hello, Terry"
    expect(User.first.email).to eq "terry@hotmail.com"
  end

  scenario 'rejects non-identical password and password confirmation' do
    # expect(page).to have_content "Password does not match confirmation"
    expect(current_path).to eq "/users/new"
    expect{failed_sign_up}.not_to change(User, :count)
  end
end
