module MovieRecommender
  class User
    attr_reader :id, :liked_movies

    def initialize(id:, liked_movies:)
      @id = id
      @liked_movies = liked_movies
    end

    def similarity_with(other_user, movies_count)
      # Create vectors for the two users, initialized to 0
      vector_a = Vector.elements(Array.new(movies_count, 0))
    
      # Set elements in the vectors that correspond to liked movies to 1
      self.liked_movies.each { |movie_id| vector_a[movie_id - 1] = 1 }
  
      vector_b = Vector.elements(Array.new(movies_count, 0))
      other_user.liked_movies.each { |movie_id| vector_b[movie_id - 1] = 1 }

      cosine_similarity(vector_a, vector_b)
    end

    def cosine_similarity(vector_a, vector_b)
      # Calculate the cosine similarity
      dot_product = vector_a.inner_product(vector_b)
      magnitude_product = Math.sqrt(vector_a.inner_product(vector_a)) * Math.sqrt(vector_b.inner_product(vector_b))

      if magnitude_product != 0
        similarity = dot_product / magnitude_product
      else
        similarity = 0
      end

      similarity
    end
  end
end
