module MovieRecommender
  class User
    attr_reader :id, :movies

    def initialize(id, movies)
      @id = id
      @movies = movies
    end
  end
end