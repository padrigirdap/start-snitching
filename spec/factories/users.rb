FactoryGirl.define do
  factory :user do
    sequence(:email) { |num| "test#{num}@gmail.com" }
    sequence(:username) { |num| "test#{num}" }
    password "test1234"
  end
end
