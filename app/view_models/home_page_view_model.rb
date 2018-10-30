class HomePageViewModel
  def featured_post
    Post.last
  end

  def new_posts
    Post.where.not(id: featured_post.id).last(3)
  end

  def popular_posts
    Post.where(id: Comment.pluck(:post_id)
                       .group_by { |e| e }
                       .map { |key, value| [key, value.size] }
                       .sort_by(&:last)
                       .last(3)
                       .map(&:first))
  end
end
