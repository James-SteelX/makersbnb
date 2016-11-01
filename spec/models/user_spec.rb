describe User do

  let!(:user) do
    User.create(first_name: 'Terry',
            last_name: 'McGuire',
            email: 'terry@hotmail.com',
            password: 'oranges!',
            password_confirmation: 'oranges!')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'not_a_password')).to be_nil
  end

end
