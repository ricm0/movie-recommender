module MovieRecommender
  class User
    attr_reader :id, :liked_movies

    def initialize(id:, liked_movies:)
      @id = id
      @liked_movies = liked_movies
    end
  end
end
