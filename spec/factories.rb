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

  factory :message do
    association :template, factory: :template
    content "Hello world"
  end

  factory :template do
    title "stuff"
    preview_url "things"
    content "<head>
    <title></title>
  </head>
  <body>
    <p>Fake Template3</p>
  </body>"
  end
end


