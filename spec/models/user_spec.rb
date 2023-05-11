require_relative '../../lib/movie_recommender/user'

RSpec.describe MovieRecommender::User do
  it 'has an id and an array of movies' do
    user = MovieRecommender::User.new(1, [1, 2, 3])
    expect(user.id).to eq(1)
    expect(user.movies).to eq([1, 2, 3])
  end
end
