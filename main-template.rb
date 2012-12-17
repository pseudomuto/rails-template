# haml is just happening...
gem "haml"
gem "haml-rails"
run "bundle install"

# add rspec
if yes?("Use rspec?")
	gem_group :development, :test do
		gem "rspec-rails", "~> 2.0"
	end
	run "bundle install"
	generate("rspec:install")
end

# add cucumber
if yes?("Use cucumber?")
	gem_group :test do
		gem "cucumber-rails", :require => false
		gem "database_cleaner"
	end
	run "bundle install"
	generate("cucumber:install")
end

if yes?("Use Bootstrap?")
	gem_group :assets do
		gem "libv8", "~> 3.11.8"
		gem "therubyracer"
	end

	gem "less-rails"
	gem "twitter-bootstrap-rails"
	run "bundle install"

	# remove the default layout file
	remove_file "app/views/layouts/application.html.erb"

	generate("bootstrap:install", "less")
	generate("bootstrap:layout", "application fluid")
end

# generate home page
route "root to: 'home#index'"
remove_file "public/index.html"
generate("controller", "Home")

insert_into_file "app/controllers/home_controller.rb", :after => "< ApplicationController" do
	%Q{

	def index
		respond_to do |format|
			format.html \# render index.html.haml
		end
	end
	}
end

create_file "app/views/home/index.html.haml" do
	%Q{
%h2 Welcome to your app!

- content_for :title do
	Home Page Title
	}
end


if yes?("Use git?")
	# setup
	git :init

	# create .gitignore file
	ignore_entries = %Q{
.bundle
db/*.sqlite3
log/*.log
tmp/
.sass-cache/

# ignore emacs temp
\\#*\\#
*~
	}

	create_file ".gitignore", ignore_entries
	git :add => "."
	git :commit => "-a -m 'Initial commit.'"
end

say <<-eos
==========================================
Your new Rails Application is Ready to Go!

Scroll up to see important messages from
other gems
eos

# supress final bundle install 
def run_bundle; end