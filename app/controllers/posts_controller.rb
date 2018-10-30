class PostsController < ApplicationController
  def index
    @view_model = HomePageViewModel.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.visible
    @comment = Comment.new(post: @post)
  end
end
