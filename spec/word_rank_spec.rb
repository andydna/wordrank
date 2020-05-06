require 'word_rank'

RSpec.describe WordRank do
  let(:word_rank) { WordRank << "text" }
  let(:the_beatles) { WordRank << "the beatles" }
  let(:she_loves_you) { WordRank << "she loves you yeah yeah yeah" }

  context 'IO' do
    it 'takes a text as input' do
      raise unless WordRank << "text"
    end

    it 'returns an instance of itself as output' do
      expect(word_rank).to be_an_instance_of WordRank
    end
  end

  context 'ranking words' do
    it 'with only one word it should be the first' do
      expect(word_rank.first).to eq('text')
    end

    context "all else being equal..." do
      specify 'the longest should rank first' do
        expect(the_beatles.first).to eq('beatles')
      end

      fspecify 'highest tally should rank first' do
        expect(she_loves_you.first).to eq('yeah')
      end
    end
  end

  context 'etc' do
    it 'should ignore commond words like THE by default' do
      expect(the_beatles.to_a).not_to include('the')
    end
  end
end

__END__

ok.  so, given a list of words, which ones are the most interesting?

occurrence * rarity

occurrence is easy to do... just count and divide to get a percent

rarity... need to use someone elses data
  https://www.english-corpora.org/coca/
    claim to have billions to download but make it hard to do so

word frequency list
corpora

taking too long to get it


