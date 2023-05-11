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
    
      movie_counts = Hash.new(0)
    
      users_with_same_taste.each do |other_user|
        other_user.liked_movies.each do |movie_id|
          movie_counts[movie_id] += 1 unless liked_movies.include?(movie_id)
        end
      end
    
      sorted_movies = movie_counts.sort_by { |_, count| -count }
      recommended_movies = sorted_movies.map(&:first)
      recommended_movies = recommended_movies.reject { |movie_id| liked_movies.include?(movie_id) }
      recommended_movies.take(number_of_recommendations)
    end       
  end
end
