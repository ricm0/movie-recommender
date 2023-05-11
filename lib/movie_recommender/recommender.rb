module MovieRecommender
  class Recommender
    def initialize(users)
      @users = users
    end
  
    def recommend(liked_movie_ids)
      similar_users = @users.select do |user|
        (user.movies & liked_movie_ids).any?
      end
  
      recommended_movies = similar_users.flat_map(&:movies)
      recommended_movies -= liked_movie_ids
  
      recommended_movies.uniq
    end
  end  
end
