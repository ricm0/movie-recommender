require_relative '../../lib/movie_recommender/recommender'
require_relative '../../lib/movie_recommender/user'
require_relative '../../lib/movie_recommender/movie'

RSpec.describe MovieRecommender::Recommender do
  let(:users) do
    [
      MovieRecommender::User.new(id: 1, liked_movies: [1, 2, 3]),
      MovieRecommender::User.new(id: 2, liked_movies: [2, 3, 4]),
      MovieRecommender::User.new(id: 3, liked_movies: [3, 4, 5, 6]),
      MovieRecommender::User.new(id: 4, liked_movies: [])
    ]
  end

  let(:movies) do
    {
      1 => MovieRecommender::Movie.new(id: 1, title: "Toy Story (1995)"),
      2 => MovieRecommender::Movie.new(id: 2, title: "GoldenEye (1995)"),
      3 => MovieRecommender::Movie.new(id: 3, title: "Twelve Monkeys (1995)"),
      4 => MovieRecommender::Movie.new(id: 4, title: "Richard III (1995)"),
      5 => MovieRecommender::Movie.new(id: 5, title: "Seven (Se7en) (1995)"),
      6 => MovieRecommender::Movie.new(id: 6, title: "Usual Suspects, The (1995)")
    }
  end

  subject { described_class.new(movies, users) }

  describe '#recommend' do
    context 'when user exists and has liked movies' do
      it 'returns recommended movies' do
        recommended_movie_ids = subject.recommend(1, 2).map(&:id).sort
        expected_movie_ids = [4, 5]
        expect(recommended_movie_ids).to match(expected_movie_ids)
      end
    end
    
    context 'when user does not exist' do
      it 'returns an empty array' do
        recommendations = subject.recommend(5, 5)
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
