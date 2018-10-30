class CommentsController < ApplicationController
  def create
    @comment = Comment.new(
      params.require(:comment).permit(:content, :post_id).merge(user_id: current_user.id)
    )
    flash[:notice] = if @comment.save
                       'Komentarz został dodany'
                     else
                       @comment.errors.full_messages.join('. ')
                     end

    redirect_to @comment.post
  end

  def report
    comment = Comment.find(params[:id])
    ReportComment.run(comment: comment)
    redirect_to comment.post
  end
end
