require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_confirmation_of :password }
  it { should validate_uniqueness_of :email }
  it { should have_many :questions }

  it 'hashes the password' do
    user = FactoryBot.create(:user)
    user.password_hash.should eq BCrypt::Engine.hash_secret('password', user.password_salt)
    # user.email.should eq 'hello@gmail.com'
  end

  it 'returns user object if login successful' do
    user = FactoryBot.create(:user)
    User.authenticate(user.email, user.password).should eq user
    User.authenticate(user.email, 'pa55w0rd').should eq nil
  end
end
