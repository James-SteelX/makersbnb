require 'spec_helper'

feature 'signing up to MakersBnB' do
  scenario 'allow users to create a MakersBnB account' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(current_path).to eq "/home"
    expect(page).to have_content "Welcome, Terry"
    expect(User.first.email).to eq "terry@hotmail.com"
  end

  scenario 'signing up with a different password and password confirmation' do
    expect{ sign_up(password_confirmation: 'obviously_wrong') }.not_to change(User, :count)
    expect(current_path).to eq "/sign_up"
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'signing up with a registered email address' do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(current_path).to eq "/sign_up"
    expect(page).to have_content "Email is already taken"
  end

end
