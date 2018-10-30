class HomePageViewModel
  def featured_post
    Post.last
  end

  def new_posts
    Post.where.not(id: featured_post.id).last(3)
  end

  def popular_posts
    Post.joins(:comments).group(:post_id, :id).order('count(post_id) desc').limit(3)
  end
end
