require 'pry'
require_relative 'node'

class CompleteMe

  attr_reader :root

  def initialize
    @root= Node.new
    @word_count = 0
  end

  def insert_word(word, n=0,current_node=@root)
    word = word.downcase
    unless current_node.children.include?(word[n])
      current_node.children[word[n]] = Node.new
      flag_word(word, n, current_node)
      insert_word(word, n+1, current_node.children[word[n]]) if n < word.length - 1
    else
      insert_word(word, n+1, current_node.children[word[n]]) if n < word.length - 1
    end
  end

  def flag_word(word, n, current_node)
    if n == word.length - 1
      current_node.children[word[n]].word_end = true
      @word_count += 1
    end
  end

  def count
    @word_count
  end


end
