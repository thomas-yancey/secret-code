count_of_users = 15
count_of_messages = 3

count_of_users.times do
  user = User.new(username: Faker::Internet.user_name)
  user.email = Faker::Internet.free_email(user.username)
  user.password = "password"
  user.save
end

Template.create(content: "<html>
  <head>
    <title></title>
  </head>
  <body>
    <p>Fake Template1</p>
  </body>
</html>")
Template.create(content: "<html>
  <head>
    <title></title>
  </head>
  <body>
    <p>Fake Template2</p>
  </body>
</html>")
Template.create(content: "<html>
  <head>
    <title></title>
  </head>
  <body>
    <p>Fake Template3</p>
  </body>
</html>")
Algorithm.create(case: "1+1", answer: "2")
Algorithm.create(case: "2+2", answer: "4")
Algorithm.create(case: "3+3", answer: "6")
Algorithm.create(case: "4+4", answer: "8")
Algorithm.create(case: "5+5", answer: "10")

algorithms = Algorithm.all
templates = Template.all
users = User.all
(count_of_users * 5).times do
  Message.create(template: templates.sample, content: Faker::Lorem.paragraph(2))
end

Message.all.each do |message|
  Secret.create(sender: users.sample, receiver: users.sample, message: message, algorithm: algorithms.sample)
end


