Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # get "/blog_posts/new", to: "blog_posts#new",as: :new_blog_post
  # get "/blog_posts/:id", to: 'blog_posts#show', as: :blog_post
  # # updates the blog post based on id
  # patch "/blog_posts/:id", to: 'blog_posts#update'
  # # deletes the blog post based on id
  # delete "/blog_posts/:id", to: 'blog_posts#destroy'
  # # displays the edit form
  # get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
  # # posts our new blog post that we create
  # post "/blog_posts", to: "blog_posts#create", as: :blog_posts

  # You can use Resources in rails instead of writing out all of your http requests (you still need to include the root route)
  # ex. resources :blog_posts
  
  resources :blog_posts 

  # Defines the root path route ("/")
  root "blog_posts#index"
end
