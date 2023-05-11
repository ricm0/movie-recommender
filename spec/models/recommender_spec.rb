require_relative '../../lib/movie_recommender/recommender'
require_relative '../../lib/movie_recommender/user'

RSpec.describe MovieRecommender::Recommender do
  let(:users) do
    [
      MovieRecommender::User.new(id: 1, liked_movies: [5, 9, 12, 13]),
      MovieRecommender::User.new(id: 2, liked_movies: [1, 3, 4, 6, 7, 8, 10, 12]),
      MovieRecommender::User.new(id: 3, liked_movies: [1, 3, 5, 6, 8, 9, 11, 12, 14]),
      MovieRecommender::User.new(id: 4, liked_movies: [])
    ]
  end

  subject { described_class.new(users) }

  describe '#recommend' do
    context 'when user exists and has liked movies' do
      it 'returns recommended movies' do
        recommendations = subject.recommend(1, 5)
        expect(recommendations).to match_array([1, 3, 4, 6, 7])
      end
    end

    context 'when user does not exist' do
      it 'returns an empty array' do
        recommendations = subject.recommend(4, 5)
        expect(recommendations).to be_empty
      end
    end

    context 'when user has no liked movies' do
      it 'returns an empty array' do
        recommendations = subject.recommend(4, 5)
        expect(recommendations).to be_empty
      end
    end
  end
end
