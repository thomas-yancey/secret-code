count_of_users = 15
count_of_messages = 3

count_of_users.times do
  user = User.new(username: Faker::Internet.user_name)
  user.email = Faker::Internet.free_email(user.username)
  user.password = "password"
  user.save
end

Template.create(title: "Castle",
  preview_url: "assets/template-previews/castle-preview.png",
  content: "
<html>
<body>
<p>Castle Template</p>
</body>
</html>")
Template.create(title: "Space",
  preview_url: "assets/template-previews/space-preview.png",
  content: "
<html>
<head>
<style>
body {
     /* change the background color */
     background-color: white;

     /* change to 'left' or 'right' to move text */
     text-align: center;
}
     /* change the color of the To text */
h1 { color: black; }

     /* change the color of the message text */
h2 { color: black; }

     /* change the color of the From text */
h3 { color: black; }

img { position: absolute; }

     /* change the position of the images */

#moon {
    bottom: 0;
    left: 25%; }

#astronaut {
    bottom: 30%;
    left: 30%; }

#earth {
    top: 25%;
    left: 10%; }

#orange-planet {
    top: 10%;
    right: 8%; }

#blue-planet {
    bottom: 10%;
    left: 6%; }

#ufo {
    top: 25%;
    right: 15%; }

</style>
</head>
<body>

<!-- write your friend's name -->
<h1>To:
</h1>

<h2>
<!-- write a message to your friend -->
your message  here

</h2>

<!-- sign your name -->
<h3>From:
</h3>

<img src='/assets/moon.png' id='moon'>
<img src='/assets/astronaut.png' id='astronaut'>
<img src='/assets/earth.png' id='earth'>
<img src='/assets/orange-planet.png' id='orange-planet'>
<img src='/assets/blue-planet.png' id='blue-planet'>
<img src='/assets/ufo.png' id='ufo'>

</body>
</html>")
Template.create(title: "Ocean",
  preview_url: "assets/template-previews/ocean-preview.png",
  content: "
<html>
<body>
<p>Castle Template</p>
</body>
</html>")

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
  Message.create(content: Faker::Lorem.paragraph(2))
end

Message.all.each do |message|
  Secret.create(sender: users.sample, receiver: users.sample, message: message, algorithm: algorithms.sample)
end


