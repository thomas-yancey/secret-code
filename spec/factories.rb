FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username "jon"
    password "password"
    password_confirmation "password"
  end

  factory :secret do
    sender_id 2
    receiver_id 3
    algorithm_id 4
    message_id 3
    solved false
  end
end


