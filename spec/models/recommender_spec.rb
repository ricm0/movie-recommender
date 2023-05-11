require_relative '../../lib/movie_recommender/recommender'
require_relative '../../lib/movie_recommender/user'

RSpec.describe MovieRecommender::Recommender do
  let(:users) {
    [
      MovieRecommender::User.new(1, [1, 2, 3]),
      MovieRecommender::User.new(2, [2, 3, 4]),
      MovieRecommender::User.new(3, [4, 5, 6])
    ]
  }
  let(:recommender) { MovieRecommender::Recommender.new(users) }

  it 'recommends movies based on liked movie ids' do
    recommended_movies = recommender.recommend([1, 2])
    expect(recommended_movies).to contain_exactly(3, 4)
  end
end
