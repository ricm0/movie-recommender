require_relative '../../lib/movie_recommender/user'

RSpec.describe MovieRecommender::User do
  let(:user_data) { { 'user_id' => 1, 'movies' => [5, 9, 12, 13] } }

  subject { described_class.new(id: user_data['user_id'], liked_movies: user_data['movies']) }

  describe '#initialize' do
    it 'sets the id' do
      expect(subject.id).to eq(user_data['user_id'])
    end

    it 'sets the liked movies' do
      expect(subject.liked_movies).to eq(user_data['movies'])
    end
  end
end
