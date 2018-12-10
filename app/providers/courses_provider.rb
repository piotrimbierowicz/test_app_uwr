class CoursesProvider
  attr_reader :results

  def initialize(key)
    @results = Course.all
    filter_by_key(key)
  end

  def filter_by_key(key)
    @results = if key.blank?
                 []
               else
                 @results.where('lower(name) like ?', "%#{key.downcase}%")
               end
  end
end
