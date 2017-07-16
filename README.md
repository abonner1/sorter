# Sorter - Coding Resource Manager

Sorter - Coding Resource Manager is a Web App, with a Rails back-end, to help aspiring coders store and organize their coding resources based on the language they are studying. There is also course functionality for online coding schools to organize resources by class.

You can:

* Create new resources and update them

* You can delete resources

* You can add new languages and delete

* You can sort resources by topic

* You can sign into this app through GitHub

# Installation

Clone this repository, then run:
```
$ bundle install
```

# Usage

Migrate the database and load example date with:
```
$ rake db:migrate && rake db:seed
```
Start the serve by running:
```
$ rails s
```
Run the app in your web browser with:
```
$ open http://localhost:3000
```

## OAUTH

You will need to acquire your own keys for GitHub OmniAuth to work. Go to settings on your GitHub account and make a new app through the OAuth Applications under Developer Settings. There aren't any apps added to ease loading of environment variables at this time (although it's soon to come). You will need to establish your keys in the terminal before running the server:
```
$ export GITHUB_KEY=000000000000
$ export GITHUB_SECRET=0000000000000000000000000
```

## Tech

This application uses a few different open source projects to work properly. Those include:

* [Rails](https://github.com/rails/rails) - A web application framework that helps with everything from initializing an app to to fine tuning it in accordance with a Models-Views-Controllers (MVC) pattern.

* [RSpec](https://github.com/rspec/rspec) - A Domain Specific Language (DSL) made with Ruby and compatible with Rails used to test your code. Pair with [Capybara](https://github.com/teamcapybara/capybara) to test your MVC, too.

* [Devise](https://github.com/plataformatec/devise) - An authentication gem perfect for constructing User login and registration.

# TODO

This is just to say there is much more functionality to come. Add it won't always be render in plain HTML. Watch for updates!

# Contributors

This space is intended to be an opening and welcoming environment for collaboration in contribution, and as such all contributors are expected to maintain the principles of [Contributor Covenenant](http://contributor-covenant.org/). Please, report any bugs on GitHub at this project's [repository](https://github.com/abonner1/code_learning_resources_manager).

# License

This Web Application has been made available as an open source under the terms of the [MIT License](https://github.com/abonner1/code_learning_resources_manager/blob/master/LICENSE.md).
