class ReportComment < ActiveInteraction::Base
  object :comment

  def execute
    update_comment
    send_notification
  end

  private

  def update_comment
    comment.update hidden: true, needs_review: true
  end

  def send_notification
    CommentReviewNotificationWorker.perform_async(comment.id)
  end
end
