require_relative '../../lib/movie_recommender/user'

RSpec.describe MovieRecommender::User do
  let(:user1) { MovieRecommender::User.new(id: 1, liked_movies: [1, 2, 3]) }
  let(:user2) { MovieRecommender::User.new(id: 2, liked_movies: [2, 3, 4]) }
  let(:user3) { MovieRecommender::User.new(id: 3, liked_movies: [4, 5, 6]) }

  it 'calculates similarity with another user correctly' do
    expect(user1.similarity_with(user2, 6)).to be > 0
    expect(user1.similarity_with(user3, 6)).to eq(0)
  end
end
