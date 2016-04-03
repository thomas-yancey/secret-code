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
Template.create(title: "Space",
  preview_url: "assets/template-previews/space-preview.png",
  content: "<head>

<!--   In this section you can change colors and sizes!  -->

<style>
body { text-align: center;
background-color: white;
}
h1 { color: black; }
h2 { color: black;
  position: absolute; bottom: 50px; left: 25%; }
#moon { position: absolute;
  bottom: 0; left: 25%; }
#astronaut { position: absolute;
  bottom: 160px; left: 30%; }
#earth { position: absolute;
  top: 50px; left: 10%; }
#orange-planet { position: absolute;
  top: 20px; right: 10%; }
#blue-planet { position: absolute;
  bottom: 100px; left: 10%; }
#ufo { position: absolute;
  top: 70px; right: 15%; }
</style>
</head>

<!--   In this section you can change the things you see on the page!  -->
<body>

<h1>To: <!--write your friend's name here--> </h1>

<p><!--Write a message to your friend here.--></p>

<img src='/assets/space-template/moon.png' id='moon'>
<img src='/assets/space-template/astronaut.png' id='astronaut'>
<img src='/assets/space-template/earth.png' id='earth'>
<img src='/assets/space-template/orange-planet.png' id='orange-planet'>
<img src='/assets/space-template/blue-planet.png' id='blue-planet'>
<img src='/assets/space-template/ufo.png' id='ufo'>

<h2>From: <!-- write your name here--></h2>

</body>
</html>")
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


