first_user = User.create(
      username: "andyb000",
      email: "andyb000@gmail.com",
      password: "password")

second_user = User.create(
      username: "aviflombaum",
      email: "aviflombaum@flatiron.com",
      password: "password")

python = Language.create(name: "Python")
javascript = Language.create(name: "JavaScript")
ruby = Language.create(name: "Ruby")

new_topic = Topic.create(name: "Associations")
another_topic = Topic.create(name: "Learning JavaScript")
and_another_topic = Topic.create(name: "Ruby Gems")

new_resource = first_user.resources.build(
      title: "Active Record Associations",
      url: "guides.rubyonrails.org/association_basics.html",
      description: "This is a resource!")

new_resource.language = ruby
new_resource.topics << new_topic
new_resource.save

another_resource = second_user.resources.build(
      title: "JaveScript Site",
      url: "www.javascript.com",
      description: "Another resource!"
)

another_resource.language = javascript
another_resource.topics << another_topic
another_resource.save

and_another_resource = first_user.resources.build(
      title: "Ruby Gems",
      url: "rubygems.org",
      description: "And another one!"
)

and_another_resource.language = ruby
and_another_resource.topics << and_another_topic
and_another_resource.favorited = true
and_another_resource.save
