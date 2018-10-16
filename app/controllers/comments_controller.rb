class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params.require(:comment).permit(:content, :post_id))
    if @comment.save
      flash[:notice] = 'Komentarz został dodany'
      redirect_to @comment.post
    else
      flash[:notice] = @comment.errors.full_messages.join('. ')
      redirect_to @comment.post
    end
  end

end
