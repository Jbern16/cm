require 'pry'
require_relative 'node'

class CompleteMe

  attr_reader :root

  def initialize
    @root= Node.new
    @word_count = 0
  end

  def insert_word(word, i=0,current_node=@root)
    unless current_node.children.include?(word[i])
      current_node.children[word[i]] = Node.new
      flag_word(word, i, current_node)
      insert_word(word, i+1, current_node.children[word[i]]) if i < word.length - 1
    else
      insert_word(word, i+1, current_node.children[word[i]]) if i < word.length - 1
    end
  end

  def flag_word(word, i, current_node)
    if i == word.length - 1
      current_node.children[word[i]].word_end = true
      @word_count += 1
    end
  end

  def count
    @word_count
  end

  def load(file)
    content = File.read(file)
    content.split("\n").each do |word|
      insert_word(word)
    end
    "You've inserted #{count} words!"
  end



end
