class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :get_posts, only: [:index]
    before_action :new_post, only: [:new]
    before_action :get_comments, only: [:show]
    before_action :create_posts, only: [:create]

    def index;end

    def show;end

    def new;end

    def create
      if @post.save
        redirect_to @post
      else
        render 'new'
      end
    end

    def update
  		if @post.update(post_params)
  			redirect_to @post
  		else
  			render 'edit'
  		end
	  end

  	def edit
  	end


    def destroy
      @post.destroy if @post.present?
      redirect_to posts_path
    end

   private


   def set_post
      @post = Post.find(params[:id])
   end

   def get_posts
     if params[:blog_id].present?
       @posts = Blog.find(params[:blog_id]).posts
     else
       @posts = Post.all
     end
   end

   def new_post
     @post = Post.new
   end

   def get_comments
     @comments = @post.comments
   end

   def create_posts
     s_user = session[:current_user]
     @user = User.find(s_user['id'])
     @post = @user.posts.new(post_params)
   end

   def post_params
  	  params.require(:post).permit(:title, :content, :image, :blog_id)
   end
end
