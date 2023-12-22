class BlogPostsController < ApplicationController
    # this action will make it so you have to login before your can edit update or delet posts
    before_action :authenticate_user!, except: [:index, :show]
    # to refactor this code so you don't have to write @blog_post = BlogPost.find(params[:id]) over and over you can use a before_action to set it as a variable and include it to your specific methods by included the methods in the 'only:' array, or you can use 'except:' to list the methods you don't want to include it in
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

    def index
        @blog_posts = BlogPost.all
    end

    def show 
        
        # the rescue statement redirects to the home page if the blog_posts id is invalid
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
#  creating a new blog post form
    def new
        @blog_post = BlogPost.new
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)
        # if blog_post save was true then it will redirect you to the new blog post
        if @blog_post.save
        redirect_to @blog_post
        # if the blog_post save is false it will save the form and redirect back to the form
        else
            # this overides the default in rails to return an error because the validations weren't satisfied
            render :new, status: :unprocessable_entity
        end
    end
# pulls up the current blog post id into the edit form
    def edit
        
    end
# validates the fields are present and saves the new field values(and takes you to the updated post, or renders error for missing information in the fields)
    def update
        
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            render :edit, status: :unprocessable_entity
        end
    end

#  this will delete a blog post if we no longer want it (it is best to render the delet option on the edit page)
    def destroy
        
        @blog_post.destroy
        redirect_to root_path
    end

    private
# strong params that requires the blog post to have a title and body before it can be saved/updated
    def blog_post_params
        params.require(:blog_post).permit(:title, :body)
    end

    def set_blog_post
        @blog_post = BlogPost.find(params[:id])
    end
# this is the way to write the code, but devise already has it built in

    # def authenticate_user!
    #     redirect_to new_user_session_path, alert: "You must sign in or sign up to continue." unless user_signed_in?
    # end
end