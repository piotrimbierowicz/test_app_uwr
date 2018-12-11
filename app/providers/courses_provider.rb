class CoursesProvider
  attr_reader :results

  def initialize(key)
    @results = Course.all
    filter_by_key(key)
  end

  def filter_by_key(key)
    @results = if key.nil?
                 @results
               elsif key == '' 
                 []
               else
                 @results.search(key)
               end
  end
end
