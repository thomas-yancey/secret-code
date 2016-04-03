count_of_users = 15
count_of_messages = 3

count_of_users.times do
  user = User.new(username: Faker::Internet.user_name)
  user.email = Faker::Internet.free_email(user.username)
  user.password = "password"
  user.save
end

Template.create(title: "Fake Template 1",
  preview_url: "assets/template-previews/t-1.jpg",
  content: "<head>
    <title></title>
  </head>
  <body>
    <p>Fake Template1</p>
  </body>")
Template.create(title: "Fake Template 2",
  preview_url: "assets/template-previews/t-2.jpg",
  content: "<head>
    <title></title>
  </head>
  <body>
    <p>Fake Template2</p>
  </body>")
Template.create(title: "Fake Template 3",
  preview_url: "assets/template-previews/t-3.jpg",
  content: "<head>
    <title></title>
  </head>
  <body>
    <p>Fake Template3</p>
  </body>")

  Algorithm.create(question: "Create a method that takes two numbers and adds them together",
                   method_outline: "def add(a,b)\n # your code here\nend",
                   casetests: "1,1 2,2 4,3 5,5",
                   caseanswers: "2 4 7 10")
  Algorithm.create(question: "Create a method that takes two numbers and subtracts them from each other",
                   method_outline: "def subtract(a,b)\n # your code here\nend",
                   casetests: "1,1 2,2 4,3 5,5",
                   caseanswers: "0 0 1 0")
  Algorithm.create(question: "Create a method that takes two numbers and multiplies them other",
                   method_outline:"def multiply(a,b)\n # your code here\nend",
                   casetests:"1,1 2,2 4,3 5,5",
                   caseanswers: "1, 4, 12, 25")
  Algorithm.create(question: "Create a method that takes two numbers and divides them",
                   method_outline:"def divide(a,b)\n # your code here\nend",
                   casetests:"1,1 2,2 4,3 5,5",
                   caseanswers: "1 1 1 1")

algorithms = Algorithm.all
templates = Template.all
users = User.all
(count_of_users * 5).times do
  Message.create(template: templates.sample, content: Faker::Lorem.paragraph(2))
end

Message.all.each do |message|
  Secret.create(sender: users.sample, receiver: users.sample, message: message, algorithm: algorithms.sample)
end


