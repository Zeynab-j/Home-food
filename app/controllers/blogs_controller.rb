class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_blogs, only: [:index]

  def index;end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:category)
  end

  def get_blogs
    @blogs = Blog.all
  end
end
