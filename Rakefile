require 'json'
require_relative 'lib/movie_recommender/movie'
require_relative 'lib/movie_recommender/user'
require_relative 'lib/movie_recommender/recommender'

namespace :recommend do
  desc 'Generate movie recommendations for a user'
  task :movies, [:user_id, :num_recommendations] do |t, args|
    args.with_defaults(num_recommendations: 5)
    user_id = args.user_id.to_i
    num_recommendations = args.num_recommendations.to_i

    data = JSON.parse(File.read('data/movies.json'))
    movies = data['movies'].map { |id, title| MovieRecommender::Movie.new(id: id.to_i, title: title) }
    users = data['users'].map do |user_data|
      MovieRecommender::User.new(id: user_data['user_id'], liked_movies: user_data['movies'])
    end

    recommender = MovieRecommender::Recommender.new(users)
    recommendations = recommender.recommend(user_id, num_recommendations)

    recommended_movies = recommendations.map { |id| movies.find { |movie| movie.id == id } }

    puts "Recommendations for User #{user_id}:"
    recommended_movies.each { |movie| puts movie.title }
  end
end
