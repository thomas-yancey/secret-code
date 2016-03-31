count_of_users = 15
count_of_messages = 3

count_of_users.times do
  user = User.new(username: Faker::Internet.user_name)
  user.email = Faker::Internet.free_email(user.username)
  user.password = "password"
  user.save
end

Template.create(content: "<<html>
<head>
  <title></title>
</head>
<body>
<p>Fake Template1</p>
</body>
</html>")
Template.create(content: "<<html>
<head>
  <title></title>
</head>
<body>
<p>Fake Template2</p>
</body>
</html>")
Template.create(content: "<<html>
<head>
  <title></title>
</head>
<body>
<p>Fake Template3</p>
</body>
</html>")

templates = Template.all
users = User.all
(count_of_users * 5).times do
  Message.create(template: templates.sample, content: Faker::Lorem.paragraph(2), secret_key: Faker::Hacker.abbreviation)
end

Message.all.each do |message|
  Secret.create(sender: users.sample, receiver: users.sample, message: message)
end
