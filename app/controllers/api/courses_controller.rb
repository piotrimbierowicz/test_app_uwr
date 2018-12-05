module Api
  class CoursesController < ApplicationController
    def index
      provider = CoursesProvider.new(key: params[:key])

      render json: provider.results
    end
  end
end
