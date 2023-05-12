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

      similar_users = find_similar_users(user)

      movie_scores = calculate_movie_scores(liked_movies, similar_users)

      recommended_movies = movie_scores.sort_by { |_, score| -score }.map(&:first).take(number_of_recommendations)

      recommended_movies.map { |movie_id| @movies[movie_id] }
    end

    private

    def find_similar_users(user)
      similar_users = @users.reject { |u| u.id == user.id || (user.liked_movies & u.liked_movies).empty? }

      similarity_scores = similar_users.map { |u| user.similarity_with(u, @movies.count) }

      similar_users.zip(similarity_scores).to_h
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
