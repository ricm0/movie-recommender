require_relative '../../lib/movie_recommender/movie'

RSpec.describe MovieRecommender::Movie do
  let(:movie_data) { { 'id' => 1, 'title' => 'Toy Story (1995)' } }

  subject { described_class.new(id: movie_data['id'], title: movie_data['title']) }

  describe '#initialize' do
    it 'sets the id' do
      expect(subject.id).to eq(movie_data['id'])
    end

    it 'sets the title' do
      expect(subject.title).to eq(movie_data['title'])
    end
  end
end
