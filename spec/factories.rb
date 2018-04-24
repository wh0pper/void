FactoryBot.define do
  factory(:user) do
    email('hello@gmail.com')
    password('password')
  end
end
