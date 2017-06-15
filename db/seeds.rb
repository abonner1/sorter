first_user = User.create(
      username: "andyb000",
      email: "andyb000@gmail.com",
      password: "password")

second_user = User.create(
      username: "aviflombaum",
      email: "aviflombaum@flatiron.com",
      password: "password")

ruby_on_rails = Language.create(name: "Ruby on Rails")

new_topic = Topic.create(name: "Associations")

new_resource = first_user.resources.build(
      title: "Active Record Associations",
      url: "http://guides.rubyonrails.org/association_basics.html",
      description: "This is a resource!")

new_resource.language = ruby_on_rails
new_resource.topics << new_topic
new_resource.save
