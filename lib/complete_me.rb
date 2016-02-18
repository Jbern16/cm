require_relative 'trie'

class CompleteMe

  attr_accessor :trie

  def initialize
    @trie = create_trie
  end

  def create_trie
    Trie.new
  end

  def insert(word)
    trie.insert(word)
  end

  def count
    trie.word_count
  end

  def populate(file)
    trie.populate(file)
  end

  def suggest(string)
    trie.suggest(string)
  end

  def select(string, word)
    trie.select(string, word)
  end
end
