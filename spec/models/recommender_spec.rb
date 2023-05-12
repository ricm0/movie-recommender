require_relative '../../lib/movie_recommender/recommender'
require_relative '../../lib/movie_recommender/user'
require_relative '../../lib/movie_recommender/movie'

RSpec.describe MovieRecommender::Recommender do
  let(:users) do
    [
      MovieRecommender::User.new(id: 1, liked_movies: [5, 9, 12, 13]),
      MovieRecommender::User.new(id: 2, liked_movies: [1, 3, 4, 6, 7, 8, 10, 12]),
      MovieRecommender::User.new(id: 3, liked_movies: [1, 3, 5, 6, 8, 9, 11, 12, 14]),
      MovieRecommender::User.new(id: 4, liked_movies: [])
    ]
  end

  let(:movies) do
    [
      MovieRecommender::Movie.new(id: 1, title: "Toy Story (1995)"),
      MovieRecommender::Movie.new(id: 2, title: "GoldenEye (1995)"),
      MovieRecommender::Movie.new(id: 3, title: "Twelve Monkeys (1995)"),
      MovieRecommender::Movie.new(id: 4, title: "Richard III (1995)"),
      MovieRecommender::Movie.new(id: 5, title: "Seven (Se7en) (1995)"),
      MovieRecommender::Movie.new(id: 6, title: "Usual Suspects, The (1995)"),
      MovieRecommender::Movie.new(id: 7, title: "Postino, Il (1994)"),
      MovieRecommender::Movie.new(id: 8, title: "From Dusk Till Dawn (1996)"),
      MovieRecommender::Movie.new(id: 9, title: "Braveheart (1995)"),
      MovieRecommender::Movie.new(id: 10, title: "Taxi Driver (1976)"),
      MovieRecommender::Movie.new(id: 11, title: "Bad Boys (1995)"),
      MovieRecommender::Movie.new(id: 12, title: "Apollo 13 (1995)"),
      MovieRecommender::Movie.new(id: 13, title: "Batman Forever (1995)"),
      MovieRecommender::Movie.new(id: 14, title: "Desperado (1995)"),
      MovieRecommender::Movie.new(id: 15, title: "Doom Generation, The (1995)")
    ]
  end

  subject { described_class.new(movies, users) }

  describe '#recommend' do
    context 'when user exists and has liked movies' do
      it 'returns recommended movies' do
        recommendations = subject.recommend(1, 5)
        expected_movies = [
          MovieRecommender::Movie.new(id: 1, title: "Toy Story (1995)"),
          MovieRecommender::Movie.new(id: 3, title: "Twelve Monkeys (1995)"),
          MovieRecommender::Movie.new(id: 6, title: "Usual Suspects, The (1995)"),
          MovieRecommender::Movie.new(id: 8, title: "From Dusk Till Dawn (1996)"),
          MovieRecommender::Movie.new(id: 11, title: "Bad Boys (1995)")
        ]
        expect(recommendations).to match_array(expected_movies)
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
