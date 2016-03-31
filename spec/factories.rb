FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@gmail.com" }
    password "password"
  end
end