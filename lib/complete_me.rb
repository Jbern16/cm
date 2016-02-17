require 'pry'
require_relative 'node'

class CompleteMe

  attr_reader :root

  def initialize
    @root= Node.new
    @word_count = 0
    @word= ""
  end

  def insert(word, n=0,current_node=@root)
    unless current_node.children.include?(word[n])
      current_node.children[word[n]] = Node.new
      flag_word(word, n, current_node)
      insert(word, n+1, current_node.children[word[n]]) if n < word.length - 1
    else
      insert(word, n+1, current_node.children[word[n]]) if n < word.length - 1
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

  def load(file)
    content = File.read(file)
    content.split("\n").each do |word|
      insert(word)
    end
    "You've inserted #{count} words!"
  end

  # def suggest(string, n=0,  current_node=@root)

  #   unless current_node.children = Hash.new
  #     current_node.children.each_key do |key|
  #       word += key
  #       if current_node.end_of_word
  #         suggestions << words
  #       end
  #      suggest(word, suggestions, current_node.children[word[n]])
  #     end
  #   end








end
