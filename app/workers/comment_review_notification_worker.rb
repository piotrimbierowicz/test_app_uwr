class CommentReviewNotificationWorker
  include Sidekiq::Worker

  def perform(comment_id)
    EmailNotificationService.new(comment_id).call
  end
end
