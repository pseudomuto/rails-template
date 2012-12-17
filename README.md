Purpose
==============

This is an application template I use for creating new rails apps. Basically the template:

- Switches the layout engine to Haml
- Generates app/controllers/HomeController and adds an index action
- Generates app/views/home/index.html.haml
- Adds "root to: 'home#index'" to config/routes.rb

Optionally does the following:
==============================

The template will ask whether or not you want to use these features/gems:

- Add and install RSpec
- Add and install Cucumber
- Add and install twitter-bootstrap-rails (with less), using therubyracer (will fix later)
	- removes /app/views/layouts/application.html.erb
	- creates fluid layout at /app/views/layouts/application.html.haml
- Inits and Initial Commit for Git
	- create .gitignore with common rails exlusions
	- git init and git add '.'
	- git commit -a -m "Initial commit."

Usage
=====

Assuming you intend to use RSpec, you will probably want to pass -T to exlude Test::Unit. Perfectly same to
omit if you intend on not using RSpec (though I'd like to know why :/)

`rails new myappname -m <thisfile.rb> -T`

If you prefer not to clone/fork/download the template, you can call it directly from the command line

`rails new myappname -m https://github.com/davidmuto/rails-template/raw/master/main-template.rb -T`