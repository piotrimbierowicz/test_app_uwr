class HomePageViewModel
  def featured_post
    Post.last
  end

  def new_posts
    Post.where.not(id: featured_post&.id).order('created_at desc').first(3)
  end

  def popular_posts
    Post.left_joins(:comments).group(:post_id, :id).order('count(post_id) desc, created_at desc').first(3)
  end
end
