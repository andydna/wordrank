class WordRank
  include Enumerable

  def self.<< text
    WordRank.new(text)
  end

  def initialize(text = '')
    @text = text
  end

  def each
    words.each do |word|
      yield word
    end
  end

  private

  def words
    @words ||= most_repeated(
                text_split
               .reject(&common_words)
               .sort_by(&longest_first)
               )
  end

  def most_repeated(words)
    words.tally.sort_by do |word, tally|
      -tally
    end.collect_concat do |ary|
      ary.first
    end
  end

  def text_split
    @text_split ||= @text.split(/\s+/)
  end

  def longest_first
    proc { |word| -word.length }
  end

  def common_words
    proc { |word| common?(word) }
  end

  def common?(word)
    %w[the is a an he she my they].include? word
  end
end
