<!-- ## Notes
Building a Blog with Rails 7:

Creating a New Rails app
$ rails new blog 
$ cd blog
$ rails s - starts the server
$ rails g migrate BlogPost title:string body:text
    - this creates the BlogPost class 
$ rails db:migrate 
    - creates the BlogPost table in the database
$ rails c
    - access the rails console
$ BlogPost.create(title:'Hello World', body:'This is my first blog post')
    - creates a new BlogPost
you can save it to a variable: blog_post = BlogPost.find(1)
then update the post: blog_post.update(title:'New title')
and that will update the title only
$ blog_post.destroy : will delete the blog post


MVC Framework
- Model
    - database layer
    - validations, formating and associations
    - ruby classes
    - ex. if you need a password to be more than 12 characters.

- View
    - html, json, xml
    - the output of your application to the user
    - ex. displaying the users avatar or username

- controller
    - handles your request
    - decides how things are processed
    - ex. making a page admin only (private routes)

examples:
 user goes to the signup URL 
 - GET
    - route, /sign-up -> Users::Registrations controller
        - accesses the user model
        - renders form for HTML view
- Post
    - route, /sign-up -> Users::Registrations controller
        - accesses the user model = tries to save the user data
        - on success - log user in (set a cookie) and redirect to /homepage
        - on failure - renders the form HTML with errors (information as to why the user couldn't be created)

Defining routes
    - 

    if you try to go to a route of an invalid blog post id
    - you will get an error on your page that says: ActiveRecord::RecordNotFound in BlogPostsController#show
        - this means you have deleted that specific post so it can't be populated
            - you can update your route in the controller to so that it will take you back to the root instead of getting an error. This allows you to not edit your ruby code.
            # rescue ActiveRecord::RecordNotFound
            redirect_to root_path (or redirect_to "/")


Partial (not full html response)
    - a partial file is similary to a reusable component in react
    - file always starts with an underscore ex. _form.html.erb
    - you can render a partial in multiple locations so that you don't have to write duplicate code
        - you can give it local variables to allow the partial to give us a blog post directly
        - ex. <%= render partial: "form", locals: {blog_post: @blog_post}>

DEVISE - authentication
    - ruby gem
        - allows you to create a db model for our users
        - handles all the authentication
        - handles emails for resetting passwords or confimation emails when updating email addresses
        - updating and resetting password
        - handles security for our site as well
    - to add to your application
        - $ bundle add devise
        - adds devise to bottom of you gem file
        - $ rails g 
        - $ rails g devise:install
            - generates locales - for translations
            - generates the initializers
        - define default url options
            - config/environments/development.rb
                - paste at bottom = config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
        - you can now display notices and alerts by pasting these tags in your application.html.erb under the <body> tag
            - <p class="notice"><%= notice %></p>
            - <p class="alert"><%= alert %></p>
        - now we need to gerate a model for users
            - $ rails g devise User
            - generates a migration for creating a User 
            - model for User for test
            - route for devise_for :users (special route that allows signup links, login links, and edit links)
    - Edit styling on Devise pages
        - $ rails g devise:views

Adding Tailwind Rails gem to your application
 - $ bundle add tailwindcss-rails
 - $ rails tailwindcss:install

pushing your directory into a github repository
- create a github repository with the same name as your project
    - $ git remote add origin https://github.com/JAKEDAHLGREN/blog.git
    - $ git branch -M main
    - $ git push -u origin main

deploying on render
- create a web service
- connect repo 
- name project
- build command
    - $bundle install; bundle exec rake assets:precompile; bundle exec rake assets:clean;
- start command
    - $ bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}

Schedule a blog post
- option 1
    - 'status' string field
        - draft
        - published
        - scheduled (does not give exact time to publish)
-option 2
    - 'published_at' datetime field (this will give a specific time to publish the post so it is visible to the user)
        - nil (not published)
        - 1.year.ago
        - 1.year.from_now 
 -->
