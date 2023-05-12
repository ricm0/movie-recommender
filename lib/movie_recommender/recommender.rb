require 'matrix'

module MovieRecommender
  class Recommender
    def initialize(movies, users)
      @movies = movies
      @users = users
    end

    def recommend(user_id, number_of_recommendations = 5)
      user = @users.find { |user| user.id == user_id }
      return [] if user.nil? || user.liked_movies.empty?

      liked_movies = user.liked_movies

      similar_users = find_similar_users(user_id)

      movie_scores = calculate_movie_scores(liked_movies, similar_users)

      recommended_movies = movie_scores.sort_by { |_, score| -score }.map(&:first).take(number_of_recommendations)

      recommended_movies.map { |movie_id| @movies[movie_id] }
    end

    private

    def find_similar_users(user_id)
      user = @users.find { |user| user.id == user_id }
      return [] if user.nil? || user.liked_movies.empty?

      liked_movies = user.liked_movies

      similar_users = @users.reject { |u| u.id == user_id || (liked_movies & u.liked_movies).empty? }

      similarity_scores = calculate_similarity_scores(user.liked_movies, similar_users)

      similar_users.zip(similarity_scores).to_h
    end

    def calculate_similarity_scores(liked_movies, users)
      similarity_scores = []

      # Create vectors for the two users, initialized to 0
      vector_a = Vector.elements(Array.new(@movies.count, 0))
    
      # Set elements in the vectors that correspond to liked movies to 1
      liked_movies.each { |movie_id| vector_a[movie_id - 1] = 1 }

      users.each do |user|
        vector_b = Vector.elements(Array.new(@movies.count, 0))
        user.liked_movies.each { |movie_id| vector_b[movie_id - 1] = 1 }

        similarity_score = cosine_similarity(vector_a, vector_b)
        similarity_scores << similarity_score
      end

      similarity_scores
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

    def calculate_movie_scores(liked_movies, similar_users)
      movie_scores = Hash.new(0)

      similar_users.each do |user, similarity_score|
        user.liked_movies.each do |movie_id|
          next if liked_movies.include?(movie_id)

          movie_scores[movie_id] += similarity_score
        end
      end

      movie_scores
    end
  end
end
