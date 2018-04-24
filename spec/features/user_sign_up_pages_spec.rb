require 'rails_helper'

describe User do
  it 'has an email' do
    user = FactoryBot.create(:user)
    user.email.should eq 'hello@gmail.com'
  end
end
