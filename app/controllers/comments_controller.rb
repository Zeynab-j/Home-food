class CommentsController < ApplicationController
  before_action :authenticate_user!, :get_post

  def create
	 	@comment = @post.comments.create(comments_params)
    @comment.update(user_id: session[:current_user]["id"])
		redirect_to post_path(@post)
	end

  private

  def comments_params
    params[:comment].permit(:comment, :post_id)
  end

  def get_post
    @post = Post.find(params[:post_id])
  end
end
