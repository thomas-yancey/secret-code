FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username "jon"
    password "password"
    password_confirmation "password"
  end

  factory :secret do
    association :sender, factory: :user
    association :receiver, factory: :user
    message_id 3
    solved false
  end

  factory :algorithm do
    question "Create a method that takes two numbers and adds them together"
    method_outline "def add(a,b)\n # your code here\nend"
    casetests "1,1 2,2 4,3 5,5"
    caseanswers "2 4 7 10"
  end
end


