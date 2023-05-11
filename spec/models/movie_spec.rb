require_relative '../../lib/movie_recommender/movie'

RSpec.describe MovieRecommender::Movie do
  it 'has an id and a title' do
    movie = MovieRecommender::Movie.new(1, 'Toy Story (1995)')
    expect(movie.id).to eq(1)
    expect(movie.title).to eq('Toy Story (1995)')
  end
end
