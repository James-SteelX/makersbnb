require 'spec_helper'
require_relative 'web_helpers'

feature 'signing up to MakersBnB' do
  scenario 'allow users to create a MakersBnB account' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq "/home"
    expect(page).to have_content "Hello, Terry"
    expect(User.first.email).to eq "terry@hotmail.com"
  end
end
