module MovieRecommender
  class Recommender
    def initialize(users)
      @users = users
    end

    def recommend(user_id, number_of_recommendations = 5)
      user = @users.find { |user| user.id == user_id }
      return [] if user.nil? || user.liked_movies.empty?
    
      liked_movies = user.liked_movies
    
      users_with_same_taste = @users.reject { |u| u.id == user_id || (liked_movies & u.liked_movies).empty? }
    
      recommended_movies = users_with_same_taste.flat_map(&:liked_movies).uniq - liked_movies
    
      recommended_movies.take(number_of_recommendations)
    end    
  end
end
